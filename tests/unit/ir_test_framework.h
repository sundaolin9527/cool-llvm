#ifndef COOL_TESTS_UNIT_IR_TEST_FRAMEWORK_H
#define COOL_TESTS_UNIT_IR_TEST_FRAMEWORK_H

#include <filesystem>
#include <optional>
#include <string>
#include <vector>

struct IrGoldenTestCase {
    std::string name;
    std::filesystem::path inputPath;
    std::filesystem::path expectedIrPath;
};

struct IrDiffDetail {
    std::size_t lineNumber = 0;
    std::string expectedLine;
    std::string actualLine;
};

struct IrGoldenTestResult {
    IrGoldenTestCase testCase;
    bool passed = false;
    int commandExitCode = 0;
    std::string command;
    std::string actualIr;
    std::string message;
    std::optional<IrDiffDetail> diffDetail;
};

struct IrGoldenRunnerOptions {
    std::filesystem::path repoRoot;
    std::filesystem::path casesDir;
    std::string commandTemplate;
    std::string filter;
    bool listOnly = false;
    bool verbose = false;
};

class IrGoldenTestFramework {
public:
    explicit IrGoldenTestFramework(IrGoldenRunnerOptions options);

    static std::string defaultCommandTemplate();

    std::vector<IrGoldenTestCase> discoverCases() const;
    IrGoldenTestResult runCase(const IrGoldenTestCase& testCase) const;
    std::vector<IrGoldenTestResult> runAll() const;

private:
    struct CommandResult {
        int exitCode = -1;
        std::string output;
    };

    IrGoldenRunnerOptions options_;

    static std::filesystem::path discoverRepoRoot(const std::filesystem::path& start);
    static std::string normalizeText(const std::string& text);
    static std::vector<std::string> splitLines(const std::string& text);
    static std::string shellEscape(const std::filesystem::path& path);
    static std::string replaceAll(std::string text, const std::string& needle, const std::string& value);
    static CommandResult runCommand(const std::string& command);

    std::string buildCommand(const IrGoldenTestCase& testCase) const;
    std::optional<IrDiffDetail> diffIr(const std::string& expected, const std::string& actual) const;
};

#endif
