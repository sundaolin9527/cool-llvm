#include "ir_test_framework.h"

#include <exception>
#include <iostream>
#include <stdexcept>

namespace {

void print_usage(const char* program) {
    std::cout
        << "Usage: " << program << " [options]\n"
        << "  --repo-root <path>      Repository root, default: auto-discover\n"
        << "  --cases-dir <path>      Directory containing .cl and .expected.txt pairs\n"
        << "  --compile-ir-cmd <tmpl> Command template that writes LLVM IR to stdout\n"
        << "  --link-cmd <tmpl>       Command template that links {actual_ir} to {executable}\n"
        << "  --run-cmd <tmpl>        Command template used to execute {executable}\n"
        << "  --filter <text>         Run only matching cases\n"
        << "  --list                  List discovered cases only\n"
        << "  --verbose               Print command for each case\n"
        << "  --help                  Show this help\n";
}

}  // namespace

int main(int argc, char** argv) {
    try {
        UnitRunnerOptions options;

        for (int index = 1; index < argc; ++index) {
            const std::string arg = argv[index];
            auto require_value = [&](const char* flag) -> std::string {
                if (index + 1 >= argc) {
                    throw std::runtime_error(std::string("missing value for ") + flag);
                }
                return argv[++index];
            };

            if (arg == "--repo-root") {
                options.repoRoot = require_value("--repo-root");
            } else if (arg == "--cases-dir") {
                options.casesDir = require_value("--cases-dir");
            } else if (arg == "--compile-ir-cmd") {
                options.compileIrCommandTemplate = require_value("--compile-ir-cmd");
            } else if (arg == "--link-cmd") {
                options.linkCommandTemplate = require_value("--link-cmd");
            } else if (arg == "--run-cmd") {
                options.runCommandTemplate = require_value("--run-cmd");
            } else if (arg == "--filter") {
                options.filter = require_value("--filter");
            } else if (arg == "--list") {
                options.listOnly = true;
            } else if (arg == "--verbose") {
                options.verbose = true;
            } else if (arg == "--help") {
                print_usage(argv[0]);
                return 0;
            } else {
                throw std::runtime_error("unknown argument: " + arg);
            }
        }

        UnitTestFramework framework(options);
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
            const UnitTestResult result = framework.runCase(testCase);
            if (options.verbose) {
                std::cout << "[IR ] " << result.compileCommand << "\n";
                std::cout << "[LNK] " << result.linkCommand << "\n";
                std::cout << "[RUN] " << result.runCommand << "\n";
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
            }
        }

        std::cout << "summary: " << passed << "/" << cases.size() << " passed\n";
        return passed == cases.size() ? 0 : 1;
    } catch (const std::exception& ex) {
        std::cerr << ex.what() << "\n";
        return 1;
    }
}
