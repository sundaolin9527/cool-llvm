#ifndef COOL_TESTS_GOLDEN_TEST_FRAMEWORK_H
#define COOL_TESTS_GOLDEN_TEST_FRAMEWORK_H

#include <filesystem>
#include <optional>
#include <string>
#include <vector>

enum class CommandOutputMode {
    Stdout,
    File
};

struct GoldenTestCase {
    std::string name;
    std::filesystem::path inputPath;
    std::filesystem::path expectedArtifactPath;
    std::filesystem::path actualArtifactPath;
    std::filesystem::path expectedOutputPath;
    std::filesystem::path executablePath;
};

struct TextDiffDetail {
    std::size_t lineNumber = 0;
    std::string expectedLine;
    std::string actualLine;
};

struct GoldenTestResult {
    GoldenTestCase testCase;
    bool passed = false;
    int prepareExitCode = 0;
    int linkExitCode = 0;
    int runExitCode = 0;
    bool artifactCompared = false;
    bool outputCompared = false;
    std::string prepareCommand;
    std::string linkCommand;
    std::string runCommand;
    std::string commandOutput;
    std::string actualArtifact;
    std::string actualOutput;
    std::string message;
    std::optional<TextDiffDetail> diffDetail;
};

struct GoldenRunnerOptions {
    std::filesystem::path repoRoot;
    std::filesystem::path suiteDir;
    std::filesystem::path casesDir;
    std::filesystem::path artifactsDir;
    std::string inputExtension;
    std::string expectedArtifactExtension;
    std::string fallbackExpectedArtifactExtension;
    std::string actualArtifactExtension;
    std::string expectedOutputExtension;
    std::string prepareCommandTemplate;
    std::string linkCommandTemplate;
    std::string runCommandTemplate;
    std::string programInput = "q\n";
    std::string filter;
    CommandOutputMode prepareOutputMode = CommandOutputMode::Stdout;
    bool listOnly = false;
    bool verbose = false;
};

class GoldenTestFramework {
public:
    explicit GoldenTestFramework(GoldenRunnerOptions options);

    std::vector<GoldenTestCase> discoverCases() const;
    GoldenTestResult runCase(const GoldenTestCase& testCase) const;
    std::vector<GoldenTestResult> runAll() const;

private:
    struct CommandResult {
        int exitCode = -1;
        std::string output;
    };

    GoldenRunnerOptions options_;

    static std::filesystem::path discoverRepoRoot(const std::filesystem::path& start);
    static std::string normalizeText(const std::string& text);
    static std::vector<std::string> splitLines(const std::string& text);
    static std::string shellEscape(const std::filesystem::path& path);
    static std::string replaceAll(std::string text, const std::string& needle, const std::string& value);
    static std::string readTextFile(const std::filesystem::path& path);
    static CommandResult runCommand(const std::string& command, const std::optional<std::string>& stdinText);
    static bool endsWith(const std::string& value, const std::string& suffix);
    static std::string stripSuffix(const std::string& value, const std::string& suffix);
    static std::string executableSuffix();

    std::filesystem::path resolveExpectedArtifactPath(const std::filesystem::path& basePath) const;
    std::string buildCommand(const std::string& commandTemplate, const GoldenTestCase& testCase) const;
    std::optional<TextDiffDetail> diffText(const std::string& expected, const std::string& actual) const;
};

#endif
