#include "golden_test_framework.h"

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

std::string trimTrailingCarriageReturn(std::string value) {
    if (!value.empty() && value.back() == '\r') {
        value.pop_back();
    }
    return value;
}

std::string localShellEscape(const fs::path& path) {
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

std::string escapedAbsolutePathOrEmpty(const fs::path& path) {
    if (path.empty()) {
        return "";
    }
    return localShellEscape(fs::absolute(path));
}

std::string escapedPathOrEmpty(const fs::path& path) {
    if (path.empty()) {
        return "";
    }
    return localShellEscape(path);
}

}  // namespace

GoldenTestFramework::GoldenTestFramework(GoldenRunnerOptions options)
    : options_(std::move(options)) {
    if (options_.repoRoot.empty()) {
        options_.repoRoot = discoverRepoRoot(fs::current_path());
    }
    if (options_.suiteDir.empty()) {
        options_.suiteDir = fs::current_path();
    }
    if (options_.casesDir.empty()) {
        options_.casesDir = options_.suiteDir / "cases";
    }
    if (options_.artifactsDir.empty()) {
        options_.artifactsDir = options_.suiteDir / ".artifacts";
    }
}

std::vector<GoldenTestCase> GoldenTestFramework::discoverCases() const {
    std::vector<GoldenTestCase> cases;
    if (options_.inputExtension.empty() || !fs::exists(options_.casesDir)) {
        return cases;
    }

    for (const auto& entry : fs::recursive_directory_iterator(options_.casesDir)) {
        if (!entry.is_regular_file()) {
            continue;
        }

        const std::string filename = entry.path().filename().string();
        if (!endsWith(filename, options_.inputExtension)) {
            continue;
        }

        const std::string baseName = stripSuffix(filename, options_.inputExtension);
        const fs::path basePath = entry.path().parent_path() / baseName;

        GoldenTestCase testCase;
        testCase.name = baseName;
        testCase.inputPath = entry.path();
        testCase.expectedArtifactPath = resolveExpectedArtifactPath(basePath);
        if (!options_.actualArtifactExtension.empty()) {
            testCase.actualArtifactPath = basePath;
            testCase.actualArtifactPath += options_.actualArtifactExtension;
        }
        if (!options_.expectedOutputExtension.empty()) {
            testCase.expectedOutputPath = basePath;
            testCase.expectedOutputPath += options_.expectedOutputExtension;
        }
        testCase.executablePath = options_.artifactsDir / (baseName + executableSuffix());

        if (!options_.filter.empty() &&
            testCase.name.find(options_.filter) == std::string::npos &&
            testCase.inputPath.string().find(options_.filter) == std::string::npos) {
            continue;
        }

        cases.push_back(std::move(testCase));
    }

    std::sort(cases.begin(), cases.end(), [](const GoldenTestCase& lhs, const GoldenTestCase& rhs) {
        return lhs.inputPath < rhs.inputPath;
    });
    return cases;
}

GoldenTestResult GoldenTestFramework::runCase(const GoldenTestCase& testCase) const {
    GoldenTestResult result;
    result.testCase = testCase;

    const bool compareArtifact = !testCase.expectedArtifactPath.empty();
    const bool compareOutput = !testCase.expectedOutputPath.empty();
    if (!compareArtifact && !compareOutput) {
        result.message = "no expected artifact or expected output configured";
        return result;
    }

    std::string expectedArtifact;
    if (compareArtifact) {
        if (!fs::exists(testCase.expectedArtifactPath)) {
            result.message = "missing expected artifact file: " + testCase.expectedArtifactPath.string();
            return result;
        }
        expectedArtifact = normalizeText(readTextFile(testCase.expectedArtifactPath));
    }

    std::string expectedOutput;
    if (compareOutput) {
        if (!fs::exists(testCase.expectedOutputPath)) {
            result.message = "missing expected output file: " + testCase.expectedOutputPath.string();
            return result;
        }
        expectedOutput = normalizeText(readTextFile(testCase.expectedOutputPath));
    }

    if (!testCase.actualArtifactPath.empty()) {
        fs::create_directories(testCase.actualArtifactPath.parent_path());
    }
    fs::create_directories(testCase.executablePath.parent_path());

    if (!options_.prepareCommandTemplate.empty()) {
        result.prepareCommand = buildCommand(options_.prepareCommandTemplate, testCase);
        CommandResult prepareResult = runCommand(result.prepareCommand, std::nullopt);
        result.prepareExitCode = prepareResult.exitCode;
        result.commandOutput = normalizeText(prepareResult.output);

        if (options_.prepareOutputMode == CommandOutputMode::Stdout && !testCase.actualArtifactPath.empty()) {
            std::ofstream actualArtifactStream(testCase.actualArtifactPath, std::ios::binary);
            actualArtifactStream << prepareResult.output;
        }

        if (prepareResult.exitCode != 0) {
            result.message = "prepare command failed with exit code " + std::to_string(prepareResult.exitCode);
            return result;
        }
    }

    if (compareArtifact) {
        if (testCase.actualArtifactPath.empty() || !fs::exists(testCase.actualArtifactPath)) {
            result.message = "missing actual artifact file: " + testCase.actualArtifactPath.string();
            return result;
        }
        result.actualArtifact = normalizeText(readTextFile(testCase.actualArtifactPath));
        result.artifactCompared = true;

        if (expectedArtifact != result.actualArtifact) {
            result.diffDetail = diffText(expectedArtifact, result.actualArtifact);
            if (result.diffDetail.has_value()) {
                result.message = "artifact mismatch at line " + std::to_string(result.diffDetail->lineNumber);
            } else {
                result.message = "artifact mismatch";
            }
            return result;
        }
    }

    if (!options_.linkCommandTemplate.empty()) {
        result.linkCommand = buildCommand(options_.linkCommandTemplate, testCase);
        CommandResult linkResult = runCommand(result.linkCommand, std::nullopt);
        result.linkExitCode = linkResult.exitCode;
        if (linkResult.exitCode != 0) {
            result.actualOutput = normalizeText(linkResult.output);
            result.message = "link command failed with exit code " + std::to_string(linkResult.exitCode);
            return result;
        }
    }

    if (!options_.runCommandTemplate.empty()) {
        result.runCommand = buildCommand(options_.runCommandTemplate, testCase);
        CommandResult runResult = runCommand(result.runCommand, options_.programInput);
        result.runExitCode = runResult.exitCode;
        result.actualOutput = normalizeText(runResult.output);

        if (runResult.exitCode != 0) {
            result.message = "program exited with code " + std::to_string(runResult.exitCode);
            return result;
        }

        if (compareOutput) {
            result.outputCompared = true;
            if (expectedOutput != result.actualOutput) {
                result.diffDetail = diffText(expectedOutput, result.actualOutput);
                if (result.diffDetail.has_value()) {
                    result.message = "output mismatch at line " + std::to_string(result.diffDetail->lineNumber);
                } else {
                    result.message = "output mismatch";
                }
                return result;
            }
        }
    }

    result.passed = true;
    result.message = "ok";
    return result;
}

std::vector<GoldenTestResult> GoldenTestFramework::runAll() const {
    std::vector<GoldenTestResult> results;
    for (const GoldenTestCase& testCase : discoverCases()) {
        results.push_back(runCase(testCase));
    }
    return results;
}

fs::path GoldenTestFramework::discoverRepoRoot(const fs::path& start) {
    fs::path current = start;
    while (!current.empty()) {
        if (fs::exists(current / "Makefile") &&
            fs::exists(current / "app") &&
            fs::exists(current / "tests")) {
            return current;
        }
        if (current == current.root_path()) {
            break;
        }
        current = current.parent_path();
    }
    throw std::runtime_error("failed to locate repository root from " + start.string());
}

std::string GoldenTestFramework::normalizeText(const std::string& text) {
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

std::vector<std::string> GoldenTestFramework::splitLines(const std::string& text) {
    std::vector<std::string> lines;
    std::istringstream stream(text);
    std::string line;
    while (std::getline(stream, line)) {
        lines.push_back(trimTrailingCarriageReturn(line));
    }
    if (!text.empty() && text.back() == '\n') {
        lines.emplace_back();
    }
    return lines;
}

std::string GoldenTestFramework::shellEscape(const fs::path& path) {
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

std::string GoldenTestFramework::replaceAll(std::string text, const std::string& needle, const std::string& value) {
    std::size_t position = 0;
    while ((position = text.find(needle, position)) != std::string::npos) {
        text.replace(position, needle.size(), value);
        position += value.size();
    }
    return text;
}

std::string GoldenTestFramework::readTextFile(const fs::path& path) {
    std::ifstream stream(path, std::ios::binary);
    if (!stream) {
        throw std::runtime_error("failed to open file: " + path.string());
    }

    std::ostringstream buffer;
    buffer << stream.rdbuf();
    return buffer.str();
}

GoldenTestFramework::CommandResult GoldenTestFramework::runCommand(
    const std::string& command,
    const std::optional<std::string>& stdinText
) {
    CommandResult result;
    std::string wrappedCommand = command;
    std::optional<fs::path> stdinPath;

    if (stdinText.has_value()) {
        const auto nonce = std::chrono::steady_clock::now().time_since_epoch().count();
        stdinPath = fs::temp_directory_path() / ("cool-golden-stdin-" + std::to_string(nonce) + ".txt");
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

bool GoldenTestFramework::endsWith(const std::string& value, const std::string& suffix) {
    return value.size() >= suffix.size() &&
           value.compare(value.size() - suffix.size(), suffix.size(), suffix) == 0;
}

std::string GoldenTestFramework::stripSuffix(const std::string& value, const std::string& suffix) {
    if (!endsWith(value, suffix)) {
        return value;
    }
    return value.substr(0, value.size() - suffix.size());
}

std::string GoldenTestFramework::executableSuffix() {
#ifdef _WIN32
    return ".exe";
#else
    return "";
#endif
}

fs::path GoldenTestFramework::resolveExpectedArtifactPath(const fs::path& basePath) const {
    if (!options_.expectedArtifactExtension.empty()) {
        fs::path preferred = basePath;
        preferred += options_.expectedArtifactExtension;
        if (fs::exists(preferred) || options_.fallbackExpectedArtifactExtension.empty()) {
            return preferred;
        }
    }

    if (!options_.fallbackExpectedArtifactExtension.empty()) {
        fs::path fallback = basePath;
        fallback += options_.fallbackExpectedArtifactExtension;
        return fallback;
    }

    return {};
}

std::string GoldenTestFramework::buildCommand(const std::string& commandTemplate, const GoldenTestCase& testCase) const {
    std::string command = commandTemplate;
    command = replaceAll(command, "{repo_root}", shellEscape(fs::absolute(options_.repoRoot)));
    command = replaceAll(command, "{tests_dir}", shellEscape(fs::absolute(options_.repoRoot / "tests")));
    command = replaceAll(command, "{suite_dir}", shellEscape(fs::absolute(options_.suiteDir)));
    command = replaceAll(command, "{cases_dir}", shellEscape(fs::absolute(options_.casesDir)));
    command = replaceAll(command, "{app_dir}", shellEscape(fs::absolute(options_.repoRoot / "app")));
    command = replaceAll(command, "{runtime_dir}", shellEscape(fs::absolute(options_.repoRoot / "lib" / "runtime")));
    command = replaceAll(command, "{artifacts_dir}", shellEscape(fs::absolute(options_.artifactsDir)));
    command = replaceAll(command, "{input}", shellEscape(fs::absolute(testCase.inputPath)));
    command = replaceAll(command, "{input_rel}", shellEscape(testCase.inputPath));
    command = replaceAll(command, "{expected_artifact}", escapedAbsolutePathOrEmpty(testCase.expectedArtifactPath));
    command = replaceAll(command, "{expected_artifact_rel}", escapedPathOrEmpty(testCase.expectedArtifactPath));
    command = replaceAll(command, "{actual_artifact}", escapedAbsolutePathOrEmpty(testCase.actualArtifactPath));
    command = replaceAll(command, "{actual_artifact_rel}", escapedPathOrEmpty(testCase.actualArtifactPath));
    command = replaceAll(command, "{expected_output}", escapedAbsolutePathOrEmpty(testCase.expectedOutputPath));
    command = replaceAll(command, "{expected_output_rel}", escapedPathOrEmpty(testCase.expectedOutputPath));
    command = replaceAll(command, "{executable}", escapedAbsolutePathOrEmpty(testCase.executablePath));
    command = replaceAll(command, "{executable_rel}", escapedPathOrEmpty(testCase.executablePath));
    command = replaceAll(command, "{input_stem}", testCase.name);
    return command;
}

std::optional<TextDiffDetail> GoldenTestFramework::diffText(const std::string& expected, const std::string& actual) const {
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
