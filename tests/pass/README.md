# LLVM Pass Tests

Simplified Chinese version: [README-zh-CN.md](README-zh-CN.md)

This directory stores regression tests for standalone LLVM Passes. It uses the common golden test framework under the `tests/` root.

## Directory Conventions

- `cases/*.input.ll`: input IR for a pass
- `cases/*.expected.ll`: expected textual pass output
- `cases/*.actual.ll`: actual output generated during a test run
- `cases/*.expected.txt`: expected standard output from the transformed program
- `cases/*.config`: pass plugin and pipeline configuration for the current case
- `Makefile`: builds pass plugins and invokes the common test runner

## Running Tests

Run this from the repository root:

```bash
make test-pass
```

Or run this in the current directory:

```bash
make run
```

## Test Mechanism

Tests first build `passes/*.so`, then use `opt` with each case's own `.config` to run the corresponding pass. For example:

```bash
opt -load-pass-plugin ../../passes/libGlobalDeadCodeElimPass.so \
    -passes=global-dead-code-elim -S cases/basic.input.ll -o cases/basic.actual.ll
```

The runner then links `.actual.ll` into an executable and runs it. Finally, it checks both:

- Text content of `.expected.ll` and `.actual.ll`
- `.expected.txt` and program standard output

When adding more passes later, keep using one `.config` per case. The configuration file uses a simple `key=value` format and currently supports:

- `case_plugin=../../passes/libMyAnalysisPass.so`
- `case_pipeline=function(my-analysis-pass)`
