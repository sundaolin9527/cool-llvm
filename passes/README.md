# LLVM Pass Development

Simplified Chinese version: [README-zh-CN.md](README-zh-CN.md)

This directory stores the standalone LLVM Pass plugin sources and build files for this project.

## Directory Conventions

- `*.cpp`: each source file corresponds to one standalone LLVM 16 Pass plugin
- `Makefile`: automatically discovers all `.cpp` files in this directory and builds matching `.so` plugins

## Current Passes

This directory keeps one sample pass, `CoolModuleSummaryPass.cpp`, and adds 7 passes that correspond to the assignment requirements:

- `GlobalDeadCodeElimPass.cpp`
- `InterProceduralConstantPropPass.cpp`
- `RedundantWidthReductionPass.cpp`
- `SmartLoopUnrollPass.cpp`
- `RegionBasedInstrReorderingPass.cpp`
- `LocalPinholeOptimizationPass.cpp`
- `RegSpillDetectorPass.cpp`

All of these passes are implemented with the LLVM 16 New Pass Manager plugin interface. Tests load each corresponding `.so` and pipeline per case.

Because the current test path stops at `opt` and LLVM IR without entering Machine IR, `RegSpillDetectorPass` uses a preliminary "IR-level live-value approximation of register pressure" strategy and writes the result into named metadata.

## Build

Run this from the repository root:

```bash
make llvm-pass
```

Or run this in the current directory:

```bash
make
```

When a new pass source file is added to this directory, for example `MyAnalysisPass.cpp`, `make` automatically produces `libMyAnalysisPass.so`; no `Makefile` change is required.

## Manual Verification

If `opt-16` is available in your environment, you can run any `.ll` file directly:

```bash
opt-16 \
  -load-pass-plugin ./libGlobalDeadCodeElimPass.so \
  -passes=global-dead-code-elim \
  -S ../tests/pass/cases/basic.input.ll \
  -o /tmp/basic.actual.ll
```
