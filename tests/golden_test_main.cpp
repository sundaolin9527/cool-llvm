#include "golden_test_framework.h"

#include <exception>
#include <iostream>
#include <stdexcept>

namespace {

void printUsage(const char* program) {
    std::cout
        << "Usage: " << program << " [options]\n"
        << "  --repo-root <path>              Repository root, default: auto-discover\n"
        << "  --suite-dir <path>              Suite directory, default: current directory\n"
        << "  --cases-dir <path>              Case directory, default: {suite-dir}/cases\n"
        << "  --artifacts-dir <path>          Artifact directory, default: {suite-dir}/.artifacts\n"
        << "  --input-ext <suffix>            Required case input suffix, e.g. .cl or .input.ll\n"
        << "  --expected-artifact-ext <sfx>   Expected transformed artifact suffix\n"
        << "  --fallback-expected-artifact-ext <sfx> Fallback artifact suffix when preferred file is absent\n"
        << "  --actual-artifact-ext <sfx>     Actual artifact suffix written by the test flow\n"
        << "  --expected-output-ext <sfx>     Expected program output suffix\n"
        << "  --prepare-cmd <tmpl>            Command template for compile/transform step\n"
        << "  --prepare-output <stdout|file>  Whether prepare command writes stdout or {actual_artifact}\n"
        << "  --link-cmd <tmpl>               Optional link command template\n"
        << "  --run-cmd <tmpl>                Optional run command template\n"
        << "  --program-input <text>          Optional stdin content for the run step\n"
        << "  --filter <text>                 Run only matching cases\n"
        << "  --list                          List discovered cases only\n"
        << "  --verbose                       Print command for each case\n"
        << "  --help                          Show this help\n";
}

CommandOutputMode parseCommandOutputMode(const std::string& value) {
    if (value == "stdout") {
        return CommandOutputMode::Stdout;
    }
    if (value == "file") {
        return CommandOutputMode::File;
    }
    throw std::runtime_error("unsupported command output mode: " + value);
}

}  // namespace

int main(int argc, char** argv) {
    try {
        GoldenRunnerOptions options;

        for (int index = 1; index < argc; ++index) {
            const std::string arg = argv[index];
            auto requireValue = [&](const char* flag) -> std::string {
                if (index + 1 >= argc) {
                    throw std::runtime_error(std::string("missing value for ") + flag);
                }
                return argv[++index];
            };

            if (arg == "--repo-root") {
                options.repoRoot = requireValue("--repo-root");
            } else if (arg == "--suite-dir") {
                options.suiteDir = requireValue("--suite-dir");
            } else if (arg == "--cases-dir") {
                options.casesDir = requireValue("--cases-dir");
            } else if (arg == "--artifacts-dir") {
                options.artifactsDir = requireValue("--artifacts-dir");
            } else if (arg == "--input-ext") {
                options.inputExtension = requireValue("--input-ext");
            } else if (arg == "--expected-artifact-ext") {
                options.expectedArtifactExtension = requireValue("--expected-artifact-ext");
            } else if (arg == "--fallback-expected-artifact-ext") {
                options.fallbackExpectedArtifactExtension = requireValue("--fallback-expected-artifact-ext");
            } else if (arg == "--actual-artifact-ext") {
                options.actualArtifactExtension = requireValue("--actual-artifact-ext");
            } else if (arg == "--expected-output-ext") {
                options.expectedOutputExtension = requireValue("--expected-output-ext");
            } else if (arg == "--prepare-cmd") {
                options.prepareCommandTemplate = requireValue("--prepare-cmd");
            } else if (arg == "--prepare-output") {
                options.prepareOutputMode = parseCommandOutputMode(requireValue("--prepare-output"));
            } else if (arg == "--link-cmd") {
                options.linkCommandTemplate = requireValue("--link-cmd");
            } else if (arg == "--run-cmd") {
                options.runCommandTemplate = requireValue("--run-cmd");
            } else if (arg == "--program-input") {
                options.programInput = requireValue("--program-input");
            } else if (arg == "--filter") {
                options.filter = requireValue("--filter");
            } else if (arg == "--list") {
                options.listOnly = true;
            } else if (arg == "--verbose") {
                options.verbose = true;
            } else if (arg == "--help") {
                printUsage(argv[0]);
                return 0;
            } else {
                throw std::runtime_error("unknown argument: " + arg);
            }
        }

        if (options.inputExtension.empty()) {
            throw std::runtime_error("--input-ext is required");
        }

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
    } catch (const std::exception& ex) {
        std::cerr << ex.what() << "\n";
        return 1;
    }
}
