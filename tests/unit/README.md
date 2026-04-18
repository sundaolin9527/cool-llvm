# Executable Result Unit Tests

Simplified Chinese version: [README-zh-CN.md](README-zh-CN.md)

## 1. Setup

This test suite depends on the compiler and runtime library from the repository root. Before starting, finish the basic build at the repository root:

```bash
make cgen-llvm
make runtime-lib
```

Recommended environment:

- Linux / WSL
- GNU Make
- `g++` / `clang++`
- `llvm-config-16`
- `bin/.i686/lexer`
- `app/parser`
- `app/semant`
- `app/cgen-llvm`
- `lib/runtime/libruntime.so`

If you only want to build the test runner in this directory:

```bash
make build
```

## 2. Tests

### 2.1 Run All Tests

Run this from the repository root:

```bash
make test-units
```

Or run this in the current directory:

```bash
make run
```

### 2.2 Run Selected Tests

Run this from the repository root:

```bash
make unit-test example
make unit-test cells.cl
```

Or run the runner directly in this directory:

```bash
./unit_test_runner --filter example
```

### 2.3 List Tests or Debug Commands

```bash
./unit_test_runner --list
./unit_test_runner --verbose
```

## 3. Test Mechanism

The `unit_test_runner` in this directory uses the common golden test framework under the `tests/` root, while this suite still keeps the "executable result comparison" workflow. For each `.cl` case, the runner performs these steps:

```bash
cd {app_dir} && ../bin/.i686/lexer {input} | ./parser {input} | ./semant {input} | ./cgen-llvm {input}
clang++ {actual_artifact} -L{runtime_dir} -lruntime -Wl,-rpath,{runtime_dir} -o {executable}
{executable}
```

Decision flow:

1. Read `.cl` input files from `tests/unit/cases`
2. Generate LLVM IR and write it back to the matching `.actual.ll`
3. Link the IR into an executable
4. Run the executable and compare its output line by line with `.expected.txt`

The runner feeds `q\n` to program standard input by default, which helps exit interactive programs such as `example.cl`.

## 4. File Layout

Each test usually consists of three file types:

- `xxx.cl`: input program
- `xxx.actual.ll`: LLVM IR generated during tests
- `xxx.expected.txt`: expected output

Test cases are discovered from `tests/unit/cases` by default.

## 5. Shared Framework Sources

- Shared framework header: `tests/golden_test_framework.h`
- Shared framework implementation: `tests/golden_test_framework.cpp`
- Common entry point: `tests/golden_test_main.cpp`
- Unit suite wrapper entry point: `tests/unit_test_suite_main.cpp`

`tests/unit/Makefile` only provides the command templates and file suffixes for the unit suite.

## 6. Common Options

- `--repo-root <path>`: explicitly set the repository root
- `--suite-dir <path>`: suite root directory
- `--cases-dir <path>`: test case directory
- `--artifacts-dir <path>`: executable output directory
- `--prepare-cmd <template>`: custom IR generation command template
- `--prepare-output <stdout|file>`: whether the prepare command writes to stdout or directly to a file
- `--link-cmd <template>`: custom link command template
- `--run-cmd <template>`: custom program run command template
- `--program-input <text>`: custom standard input passed to the program
- `--filter <text>`: filter tests by keyword
- `--list`: list tests only, without executing them
- `--verbose`: print the actual command for each test
- `--help`: display help
