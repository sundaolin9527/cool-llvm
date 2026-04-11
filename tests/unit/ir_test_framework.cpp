#include "ir_test_framework.h"

#include <algorithm>
#include <chrono>
#include <cstdio>
#include <fstream>
#include <sstream>
#include <stdexcept>
#include <system_error>

#ifndef _WIN32
#include <sys/wait.h>
#endif

namespace fs = std::filesystem;

namespace {

std::string trim_trailing_carriage_return(std::string value) {
    if (!value.empty() && value.back() == '\r') {
        value.pop_back();
    }
    return value;
}

fs::path default_cases_dir(const fs::path& repo_root) {
    const fs::path preferred = repo_root / "tests" / "unit" / "cases";
    if (fs::exists(preferred)) {
        return preferred;
    }

    const fs::path legacy = repo_root / "tests" / "unit" / "case";
    if (fs::exists(legacy)) {
        return legacy;
    }

    return preferred;
}

fs::path default_artifacts_dir(const fs::path& repo_root) {
    return repo_root / "tests" / "unit" / ".artifacts";
}

std::string executable_suffix() {
#ifdef _WIN32
    return ".exe";
#else
    return "";
#endif
}

}  // namespace

UnitTestFramework::UnitTestFramework(UnitRunnerOptions options)
    : options_(std::move(options)) {
    if (options_.repoRoot.empty()) {
        options_.repoRoot = discoverRepoRoot(fs::current_path());
    }
    if (options_.casesDir.empty()) {
        options_.casesDir = default_cases_dir(options_.repoRoot);
    }
    if (options_.artifactsDir.empty()) {
        options_.artifactsDir = default_artifacts_dir(options_.repoRoot);
    }
    if (options_.compileIrCommandTemplate.empty()) {
        options_.compileIrCommandTemplate = defaultCompileIrCommandTemplate();
    }
    if (options_.linkCommandTemplate.empty()) {
        options_.linkCommandTemplate = defaultLinkCommandTemplate();
    }
    if (options_.runCommandTemplate.empty()) {
        options_.runCommandTemplate = defaultRunCommandTemplate();
    }
}

std::string UnitTestFramework::defaultCompileIrCommandTemplate() {
    return "cd {app_dir} && ../bin/.i686/lexer {input} | ./parser {input} | ./semant {input} | ./cgen-llvm {input}";
}

std::string UnitTestFramework::defaultLinkCommandTemplate() {
    return "clang++ {actual_ir} -L{runtime_dir} -lruntime -Wl,-rpath,{runtime_dir} -o {executable}";
}

std::string UnitTestFramework::defaultRunCommandTemplate() {
    return "{executable}";
}

std::vector<UnitTestCase> UnitTestFramework::discoverCases() const {
    std::vector<UnitTestCase> cases;
    if (!fs::exists(options_.casesDir)) {
        return cases;
    }

    for (const auto& entry : fs::recursive_directory_iterator(options_.casesDir)) {
        if (!entry.is_regular_file() || entry.path().extension() != ".cl") {
            continue;
        }

        const fs::path stemPath = entry.path().parent_path() / entry.path().stem();
        UnitTestCase testCase;
        testCase.name = entry.path().stem().string();
        testCase.inputPath = entry.path();
        testCase.actualIrPath = stemPath;
        testCase.actualIrPath += ".actual.ll";
        testCase.expectedOutputPath = stemPath;
        testCase.expectedOutputPath += ".expected.txt";
        testCase.executablePath = options_.artifactsDir / (entry.path().stem().string() + executable_suffix());

        // Keep executable golden tests opt-in so we can store exploratory or
        // interactive examples in the cases tree without breaking the suite.
        if (!fs::exists(testCase.expectedOutputPath)) {
            continue;
        }

        if (!options_.filter.empty() &&
            testCase.name.find(options_.filter) == std::string::npos &&
            testCase.inputPath.string().find(options_.filter) == std::string::npos) {
            continue;
        }

        cases.push_back(std::move(testCase));
    }

    std::sort(cases.begin(), cases.end(), [](const UnitTestCase& lhs, const UnitTestCase& rhs) {
        return lhs.inputPath < rhs.inputPath;
    });
    return cases;
}

UnitTestResult UnitTestFramework::runCase(const UnitTestCase& testCase) const {
    UnitTestResult result;
    result.testCase = testCase;

    if (!fs::exists(testCase.expectedOutputPath)) {
        result.message = "missing expected output file: " + testCase.expectedOutputPath.string();
        return result;
    }

    std::ifstream expectedStream(testCase.expectedOutputPath, std::ios::binary);
    if (!expectedStream) {
        result.message = "failed to open expected output file: " + testCase.expectedOutputPath.string();
        return result;
    }

    std::ostringstream expectedBuffer;
    expectedBuffer << expectedStream.rdbuf();
    const std::string expectedOutput = normalizeText(expectedBuffer.str());

    fs::create_directories(testCase.actualIrPath.parent_path());
    fs::create_directories(testCase.executablePath.parent_path());

    result.compileCommand = buildCompileCommand(testCase);
    CommandResult compileResult = runCommand(result.compileCommand, std::nullopt);
    result.compileExitCode = compileResult.exitCode;
    result.actualIr = normalizeText(compileResult.output);

    {
        std::ofstream actualIrStream(testCase.actualIrPath, std::ios::binary);
        actualIrStream << compileResult.output;
    }

    if (compileResult.exitCode != 0) {
        result.message = "IR compile command failed with exit code " + std::to_string(compileResult.exitCode);
        return result;
    }

    result.linkCommand = buildLinkCommand(testCase);
    CommandResult linkResult = runCommand(result.linkCommand, std::nullopt);
    result.linkExitCode = linkResult.exitCode;
    if (linkResult.exitCode != 0) {
        result.actualOutput = normalizeText(linkResult.output);
        result.message = "link command failed with exit code " + std::to_string(linkResult.exitCode);
        return result;
    }

    result.runCommand = buildRunCommand(testCase);
    CommandResult runResult = runCommand(result.runCommand, options_.programInput);
    result.runExitCode = runResult.exitCode;
    result.actualOutput = normalizeText(runResult.output);
    if (runResult.exitCode != 0) {
        result.message = "program exited with code " + std::to_string(runResult.exitCode);
        return result;
    }

    if (expectedOutput == result.actualOutput) {
        result.passed = true;
        result.message = "ok";
        return result;
    }

    result.diffDetail = diffText(expectedOutput, result.actualOutput);
    if (result.diffDetail.has_value()) {
        const auto& diff = *result.diffDetail;
        result.message = "output mismatch at line " + std::to_string(diff.lineNumber);
    } else {
        result.message = "output mismatch";
    }
    return result;
}

std::vector<UnitTestResult> UnitTestFramework::runAll() const {
    std::vector<UnitTestResult> results;
    for (const UnitTestCase& testCase : discoverCases()) {
        results.push_back(runCase(testCase));
    }
    return results;
}

fs::path UnitTestFramework::discoverRepoRoot(const fs::path& start) {
    fs::path current = start;
    while (!current.empty()) {
        if (fs::exists(current / "Makefile") &&
            fs::exists(current / "app") &&
            fs::exists(current / "tests" / "unit")) {
            return current;
        }
        if (current == current.root_path()) {
            break;
        }
        current = current.parent_path();
    }
    throw std::runtime_error("failed to locate repository root from " + start.string());
}

std::string UnitTestFramework::normalizeText(const std::string& text) {
    std::string normalized;
    normalized.reserve(text.size());

    for (std::size_t index = 0; index < text.size(); ++index) {
        if (text[index] == '\r') {
            if (index + 1 < text.size() && text[index + 1] == '\n') {
                continue;
            }
            normalized.push_back('\n');
            continue;
        }
        normalized.push_back(text[index]);
    }

    while (!normalized.empty() && normalized.back() == '\n') {
        normalized.pop_back();
    }

    return normalized;
}

std::vector<std::string> UnitTestFramework::splitLines(const std::string& text) {
    std::vector<std::string> lines;
    std::istringstream stream(text);
    std::string line;
    while (std::getline(stream, line)) {
        lines.push_back(trim_trailing_carriage_return(line));
    }
    if (!text.empty() && text.back() == '\n') {
        lines.emplace_back();
    }
    return lines;
}

std::string UnitTestFramework::shellEscape(const fs::path& path) {
    const std::string raw = path.string();
#ifdef _WIN32
    std::string escaped = "\"";
    for (char ch : raw) {
        if (ch == '"') {
            escaped += "\\\"";
        } else {
            escaped += ch;
        }
    }
    escaped += "\"";
    return escaped;
#else
    std::string escaped = "'";
    for (char ch : raw) {
        if (ch == '\'') {
            escaped += "'\\''";
        } else {
            escaped += ch;
        }
    }
    escaped += "'";
    return escaped;
#endif
}

std::string UnitTestFramework::replaceAll(std::string text, const std::string& needle, const std::string& value) {
    std::size_t position = 0;
    while ((position = text.find(needle, position)) != std::string::npos) {
        text.replace(position, needle.size(), value);
        position += value.size();
    }
    return text;
}

UnitTestFramework::CommandResult UnitTestFramework::runCommand(
    const std::string& command,
    const std::optional<std::string>& stdinText
) {
    CommandResult result;
    std::string wrappedCommand = command;
    std::optional<fs::path> stdinPath;

    if (stdinText.has_value()) {
        const auto nonce = std::chrono::steady_clock::now().time_since_epoch().count();
        stdinPath = fs::temp_directory_path() / ("cool-unit-stdin-" + std::to_string(nonce) + ".txt");
        std::ofstream stdinStream(*stdinPath, std::ios::binary);
        stdinStream << *stdinText;
        stdinStream.close();
        wrappedCommand += " < " + shellEscape(*stdinPath);
    }

    wrappedCommand += " 2>&1";

#ifdef _WIN32
    FILE* pipe = _popen(wrappedCommand.c_str(), "r");
#else
    FILE* pipe = popen(wrappedCommand.c_str(), "r");
#endif
    if (pipe == nullptr) {
        result.output = "failed to execute command";
        if (stdinPath.has_value()) {
            std::error_code ignored;
            fs::remove(*stdinPath, ignored);
        }
        return result;
    }

    char buffer[4096];
    while (std::fgets(buffer, sizeof(buffer), pipe) != nullptr) {
        result.output += buffer;
    }

#ifdef _WIN32
    result.exitCode = _pclose(pipe);
#else
    const int rawStatus = pclose(pipe);
    if (WIFEXITED(rawStatus)) {
        result.exitCode = WEXITSTATUS(rawStatus);
    } else {
        result.exitCode = rawStatus;
    }
#endif

    if (stdinPath.has_value()) {
        std::error_code ignored;
        fs::remove(*stdinPath, ignored);
    }
    return result;
}

std::string UnitTestFramework::buildCompileCommand(const UnitTestCase& testCase) const {
    std::string command = options_.compileIrCommandTemplate;
    command = replaceAll(command, "{repo_root}", shellEscape(options_.repoRoot));
    command = replaceAll(command, "{app_dir}", shellEscape(options_.repoRoot / "app"));
    command = replaceAll(command, "{tests_dir}", shellEscape(options_.repoRoot / "tests"));
    command = replaceAll(command, "{runtime_dir}", shellEscape(options_.repoRoot / "lib" / "runtime"));
    command = replaceAll(command, "{artifacts_dir}", shellEscape(options_.artifactsDir));
    command = replaceAll(command, "{input}", shellEscape(fs::absolute(testCase.inputPath)));
    command = replaceAll(command, "{expected}", shellEscape(fs::absolute(testCase.expectedOutputPath)));
    command = replaceAll(command, "{actual_ir}", shellEscape(fs::absolute(testCase.actualIrPath)));
    command = replaceAll(command, "{executable}", shellEscape(fs::absolute(testCase.executablePath)));
    command = replaceAll(command, "{input_stem}", testCase.inputPath.stem().string());
    return command;
}

std::string UnitTestFramework::buildLinkCommand(const UnitTestCase& testCase) const {
    std::string command = options_.linkCommandTemplate;
    command = replaceAll(command, "{repo_root}", shellEscape(options_.repoRoot));
    command = replaceAll(command, "{app_dir}", shellEscape(options_.repoRoot / "app"));
    command = replaceAll(command, "{tests_dir}", shellEscape(options_.repoRoot / "tests"));
    command = replaceAll(command, "{runtime_dir}", shellEscape(options_.repoRoot / "lib" / "runtime"));
    command = replaceAll(command, "{artifacts_dir}", shellEscape(options_.artifactsDir));
    command = replaceAll(command, "{input}", shellEscape(fs::absolute(testCase.inputPath)));
    command = replaceAll(command, "{expected}", shellEscape(fs::absolute(testCase.expectedOutputPath)));
    command = replaceAll(command, "{actual_ir}", shellEscape(fs::absolute(testCase.actualIrPath)));
    command = replaceAll(command, "{executable}", shellEscape(fs::absolute(testCase.executablePath)));
    command = replaceAll(command, "{input_stem}", testCase.inputPath.stem().string());
    return command;
}

std::string UnitTestFramework::buildRunCommand(const UnitTestCase& testCase) const {
    std::string command = options_.runCommandTemplate;
    command = replaceAll(command, "{repo_root}", shellEscape(options_.repoRoot));
    command = replaceAll(command, "{app_dir}", shellEscape(options_.repoRoot / "app"));
    command = replaceAll(command, "{tests_dir}", shellEscape(options_.repoRoot / "tests"));
    command = replaceAll(command, "{runtime_dir}", shellEscape(options_.repoRoot / "lib" / "runtime"));
    command = replaceAll(command, "{artifacts_dir}", shellEscape(options_.artifactsDir));
    command = replaceAll(command, "{input}", shellEscape(fs::absolute(testCase.inputPath)));
    command = replaceAll(command, "{expected}", shellEscape(fs::absolute(testCase.expectedOutputPath)));
    command = replaceAll(command, "{actual_ir}", shellEscape(fs::absolute(testCase.actualIrPath)));
    command = replaceAll(command, "{executable}", shellEscape(fs::absolute(testCase.executablePath)));
    command = replaceAll(command, "{input_stem}", testCase.inputPath.stem().string());
    return command;
}

std::optional<TextDiffDetail> UnitTestFramework::diffText(const std::string& expected, const std::string& actual) const {
    const std::vector<std::string> expectedLines = splitLines(expected);
    const std::vector<std::string> actualLines = splitLines(actual);
    const std::size_t maxLines = std::max(expectedLines.size(), actualLines.size());

    for (std::size_t index = 0; index < maxLines; ++index) {
        const std::string expectedLine = index < expectedLines.size() ? expectedLines[index] : "<EOF>";
        const std::string actualLine = index < actualLines.size() ? actualLines[index] : "<EOF>";
        if (expectedLine != actualLine) {
            return TextDiffDetail{index + 1, expectedLine, actualLine};
        }
    }
    return std::nullopt;
}
