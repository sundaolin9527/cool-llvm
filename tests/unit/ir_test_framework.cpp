#include "ir_test_framework.h"

#include <algorithm>
#include <cstdio>
#include <fstream>
#include <sstream>
#include <stdexcept>

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

}  // namespace

IrGoldenTestFramework::IrGoldenTestFramework(IrGoldenRunnerOptions options)
    : options_(std::move(options)) {
    if (options_.repoRoot.empty()) {
        options_.repoRoot = discoverRepoRoot(fs::current_path());
    }
    if (options_.casesDir.empty()) {
        options_.casesDir = options_.repoRoot / "tests" / "unit" / "cases";
    }
    if (options_.commandTemplate.empty()) {
        options_.commandTemplate = defaultCommandTemplate();
    }
}

std::string IrGoldenTestFramework::defaultCommandTemplate() {
    return "cd {app_dir} && ../bin/.i686/lexer {input} | ./parser {input} | ./semant {input} | ./cgen-llvm {input}";
}

std::vector<IrGoldenTestCase> IrGoldenTestFramework::discoverCases() const {
    std::vector<IrGoldenTestCase> cases;
    if (!fs::exists(options_.casesDir)) {
        return cases;
    }

    for (const auto& entry : fs::recursive_directory_iterator(options_.casesDir)) {
        if (!entry.is_regular_file() || entry.path().extension() != ".cl") {
            continue;
        }

        const fs::path expectedIrPath = entry.path().parent_path() /
            (entry.path().stem().string() + ".expected.ll");
        IrGoldenTestCase testCase{
            entry.path().stem().string(),
            entry.path(),
            expectedIrPath,
        };

        if (!options_.filter.empty() &&
            testCase.name.find(options_.filter) == std::string::npos &&
            testCase.inputPath.string().find(options_.filter) == std::string::npos) {
            continue;
        }

        cases.push_back(std::move(testCase));
    }

    std::sort(cases.begin(), cases.end(), [](const IrGoldenTestCase& lhs, const IrGoldenTestCase& rhs) {
        return lhs.inputPath < rhs.inputPath;
    });
    return cases;
}

IrGoldenTestResult IrGoldenTestFramework::runCase(const IrGoldenTestCase& testCase) const {
    IrGoldenTestResult result;
    result.testCase = testCase;
    result.command = buildCommand(testCase);

    if (!fs::exists(testCase.expectedIrPath)) {
        result.message = "missing expected IR file: " + testCase.expectedIrPath.string();
        return result;
    }

    std::ifstream expectedStream(testCase.expectedIrPath, std::ios::binary);
    if (!expectedStream) {
        result.message = "failed to open expected IR file: " + testCase.expectedIrPath.string();
        return result;
    }

    std::ostringstream expectedBuffer;
    expectedBuffer << expectedStream.rdbuf();
    const std::string expectedIr = normalizeText(expectedBuffer.str());

    CommandResult commandResult = runCommand(result.command);
    result.commandExitCode = commandResult.exitCode;
    result.actualIr = normalizeText(commandResult.output);

    if (commandResult.exitCode != 0) {
        result.message = "compiler command failed with exit code " + std::to_string(commandResult.exitCode);
        return result;
    }

    if (expectedIr == result.actualIr) {
        result.passed = true;
        result.message = "ok";
        return result;
    }

    result.diffDetail = diffIr(expectedIr, result.actualIr);
    if (result.diffDetail.has_value()) {
        const auto& diff = *result.diffDetail;
        result.message = "IR mismatch at line " + std::to_string(diff.lineNumber);
    } else {
        result.message = "IR mismatch";
    }
    return result;
}

std::vector<IrGoldenTestResult> IrGoldenTestFramework::runAll() const {
    std::vector<IrGoldenTestResult> results;
    for (const IrGoldenTestCase& testCase : discoverCases()) {
        results.push_back(runCase(testCase));
    }
    return results;
}

fs::path IrGoldenTestFramework::discoverRepoRoot(const fs::path& start) {
    fs::path current = start;
    while (!current.empty()) {
        if (fs::exists(current / "SKILL.md") && fs::exists(current / "app") && fs::exists(current / "tests")) {
            return current;
        }
        if (current == current.root_path()) {
            break;
        }
        current = current.parent_path();
    }
    throw std::runtime_error("failed to locate repository root from " + start.string());
}

std::string IrGoldenTestFramework::normalizeText(const std::string& text) {
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

    return normalized;
}

std::vector<std::string> IrGoldenTestFramework::splitLines(const std::string& text) {
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

std::string IrGoldenTestFramework::shellEscape(const fs::path& path) {
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

std::string IrGoldenTestFramework::replaceAll(std::string text, const std::string& needle, const std::string& value) {
    std::size_t position = 0;
    while ((position = text.find(needle, position)) != std::string::npos) {
        text.replace(position, needle.size(), value);
        position += value.size();
    }
    return text;
}

IrGoldenTestFramework::CommandResult IrGoldenTestFramework::runCommand(const std::string& command) {
    CommandResult result;
    std::string wrappedCommand = command + " 2>&1";

#ifdef _WIN32
    FILE* pipe = _popen(wrappedCommand.c_str(), "r");
#else
    FILE* pipe = popen(wrappedCommand.c_str(), "r");
#endif
    if (pipe == nullptr) {
        result.output = "failed to execute command";
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
    return result;
}

std::string IrGoldenTestFramework::buildCommand(const IrGoldenTestCase& testCase) const {
    std::string command = options_.commandTemplate;
    command = replaceAll(command, "{repo_root}", shellEscape(options_.repoRoot));
    command = replaceAll(command, "{app_dir}", shellEscape(options_.repoRoot / "app"));
    command = replaceAll(command, "{tests_dir}", shellEscape(options_.repoRoot / "tests"));
    command = replaceAll(command, "{input}", shellEscape(fs::absolute(testCase.inputPath)));
    command = replaceAll(command, "{expected}", shellEscape(fs::absolute(testCase.expectedIrPath)));
    command = replaceAll(command, "{input_stem}", testCase.inputPath.stem().string());
    return command;
}

std::optional<IrDiffDetail> IrGoldenTestFramework::diffIr(const std::string& expected, const std::string& actual) const {
    const std::vector<std::string> expectedLines = splitLines(expected);
    const std::vector<std::string> actualLines = splitLines(actual);
    const std::size_t maxLines = std::max(expectedLines.size(), actualLines.size());

    for (std::size_t index = 0; index < maxLines; ++index) {
        const std::string expectedLine = index < expectedLines.size() ? expectedLines[index] : "<EOF>";
        const std::string actualLine = index < actualLines.size() ? actualLines[index] : "<EOF>";
        if (expectedLine != actualLine) {
            return IrDiffDetail{index + 1, expectedLine, actualLine};
        }
    }
    return std::nullopt;
}
