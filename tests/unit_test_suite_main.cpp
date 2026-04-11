#include "golden_test_framework.h"

#include <exception>
#include <iostream>
#include <stdexcept>

namespace {

void printUsage(const char* program) {
    std::cout
        << "Usage: " << program << " [options]\n"
        << "  --filter <text>         Run only matching cases\n"
        << "  --list                  List discovered cases only\n"
        << "  --verbose               Print command for each case\n"
        << "  --program-input <text>  Override stdin passed to the program\n"
        << "  --help                  Show this help\n";
}

int runFramework(const GoldenRunnerOptions& options) {
    GoldenTestFramework framework(options);
    const auto cases = framework.discoverCases();

    if (options.listOnly) {
        for (const auto& testCase : cases) {
            std::cout << testCase.name << " -> " << testCase.inputPath.string() << "\n";
        }
        std::cout << "total: " << cases.size() << "\n";
        return 0;
    }

    if (cases.empty()) {
        std::cerr << "No test cases found.\n";
        return 1;
    }

    std::size_t passed = 0;
    for (const auto& testCase : cases) {
        const GoldenTestResult result = framework.runCase(testCase);
        if (options.verbose) {
            if (!result.prepareCommand.empty()) {
                std::cout << "[PREP] " << result.prepareCommand << "\n";
            }
            if (!result.linkCommand.empty()) {
                std::cout << "[LINK] " << result.linkCommand << "\n";
            }
            if (!result.runCommand.empty()) {
                std::cout << "[RUN ] " << result.runCommand << "\n";
            }
        }

        if (result.passed) {
            ++passed;
            std::cout << "[PASS] " << result.testCase.name << "\n";
            continue;
        }

        std::cout << "[FAIL] " << result.testCase.name << ": " << result.message << "\n";
        if (result.diffDetail.has_value()) {
            std::cout << "  expected: " << result.diffDetail->expectedLine << "\n";
            std::cout << "  actual  : " << result.diffDetail->actualLine << "\n";
        } else if (!result.actualOutput.empty()) {
            std::cout << result.actualOutput << "\n";
        } else if (!result.commandOutput.empty()) {
            std::cout << result.commandOutput << "\n";
        }
    }

    std::cout << "summary: " << passed << "/" << cases.size() << " passed\n";
    return passed == cases.size() ? 0 : 1;
}

}  // namespace

int main(int argc, char** argv) {
    try {
        GoldenRunnerOptions options;
        options.repoRoot = "../..";
        options.suiteDir = ".";
        options.casesDir = "cases";
        options.artifactsDir = ".artifacts";
        options.inputExtension = ".cl";
        options.actualArtifactExtension = ".actual.ll";
        options.expectedOutputExtension = ".expected.txt";
        options.skipEmptyExpectedFiles = true;
        options.prepareOutputMode = CommandOutputMode::File;
#ifdef _WIN32
        options.prepareCommandTemplate =
            "cd {app_dir} && ../bin/.i686/lexer {input} | ./parser {input} | ./semant {input} | ./cgen-llvm {input} > {actual_artifact}";
#else
        options.prepareCommandTemplate =
            "bash -o pipefail -lc \"cd {app_dir} && ../bin/.i686/lexer {input} | ./parser {input} | ./semant {input} | ./cgen-llvm {input} > {actual_artifact}\"";
#endif
        options.linkCommandTemplate =
            "clang++ {actual_artifact} -L{runtime_dir} -lruntime -Wl,-rpath,{runtime_dir} -o {executable}";
        options.runCommandTemplate = "{executable}";

        for (int index = 1; index < argc; ++index) {
            const std::string arg = argv[index];
            auto requireValue = [&](const char* flag) -> std::string {
                if (index + 1 >= argc) {
                    throw std::runtime_error(std::string("missing value for ") + flag);
                }
                return argv[++index];
            };

            if (arg == "--filter") {
                options.filter = requireValue("--filter");
            } else if (arg == "--list") {
                options.listOnly = true;
            } else if (arg == "--verbose") {
                options.verbose = true;
            } else if (arg == "--program-input") {
                options.programInput = requireValue("--program-input");
            } else if (arg == "--help") {
                printUsage(argv[0]);
                return 0;
            } else {
                throw std::runtime_error("unknown argument: " + arg);
            }
        }

        return runFramework(options);
    } catch (const std::exception& ex) {
        std::cerr << ex.what() << "\n";
        return 1;
    }
}
