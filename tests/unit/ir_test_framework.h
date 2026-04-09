#ifndef COOL_TESTS_UNIT_IR_TEST_FRAMEWORK_H
#define COOL_TESTS_UNIT_IR_TEST_FRAMEWORK_H

#include <filesystem>
#include <optional>
#include <string>
#include <vector>

struct UnitTestCase {
    std::string name;
    std::filesystem::path inputPath;
    std::filesystem::path actualIrPath;
    std::filesystem::path expectedOutputPath;
    std::filesystem::path executablePath;
};

struct TextDiffDetail {
    std::size_t lineNumber = 0;
    std::string expectedLine;
    std::string actualLine;
};

struct UnitTestResult {
    UnitTestCase testCase;
    bool passed = false;
    int compileExitCode = 0;
    int linkExitCode = 0;
    int runExitCode = 0;
    std::string compileCommand;
    std::string linkCommand;
    std::string runCommand;
    std::string actualIr;
    std::string actualOutput;
    std::string message;
    std::optional<TextDiffDetail> diffDetail;
};

struct UnitRunnerOptions {
    std::filesystem::path repoRoot;
    std::filesystem::path casesDir;
    std::filesystem::path artifactsDir;
    std::string compileIrCommandTemplate;
    std::string linkCommandTemplate;
    std::string runCommandTemplate;
    std::string programInput = "q\n";
    std::string filter;
    bool listOnly = false;
    bool verbose = false;
};

class UnitTestFramework {
public:
    explicit UnitTestFramework(UnitRunnerOptions options);

    static std::string defaultCompileIrCommandTemplate();
    static std::string defaultLinkCommandTemplate();
    static std::string defaultRunCommandTemplate();

    std::vector<UnitTestCase> discoverCases() const;
    UnitTestResult runCase(const UnitTestCase& testCase) const;
    std::vector<UnitTestResult> runAll() const;

private:
    struct CommandResult {
        int exitCode = -1;
        std::string output;
    };

    UnitRunnerOptions options_;

    static std::filesystem::path discoverRepoRoot(const std::filesystem::path& start);
    static std::string normalizeText(const std::string& text);
    static std::vector<std::string> splitLines(const std::string& text);
    static std::string shellEscape(const std::filesystem::path& path);
    static std::string replaceAll(std::string text, const std::string& needle, const std::string& value);
    static CommandResult runCommand(const std::string& command, const std::optional<std::string>& stdinText);

    std::string buildCompileCommand(const UnitTestCase& testCase) const;
    std::string buildLinkCommand(const UnitTestCase& testCase) const;
    std::string buildRunCommand(const UnitTestCase& testCase) const;
    std::optional<TextDiffDetail> diffText(const std::string& expected, const std::string& actual) const;
};

#endif
