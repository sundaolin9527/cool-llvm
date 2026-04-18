# COOL Compiler with LLVM Backend

Simplified Chinese version: [README-zh-CN.md](README-zh-CN.md)

## 1. Setup

### 1.1 Recommended Environment

This project is currently developed mainly for Linux/WSL, with Ubuntu 20.04+ or Debian 12+ preferred.
If you work on Windows, WSL2 is recommended. The repository depends on GNU Make, `llvm-config-16`, and `.so` runtime libraries by default, so a native PowerShell environment usually cannot build it directly.

### 1.2 Install Dependencies

Ubuntu / Debian:

```bash
sudo apt-get update
sudo apt-get install -y build-essential make flex bison clang llvm-16 llvm-16-dev libfl-dev
```

Before building, make sure the following commands are available:

```bash
llvm-config-16 --version (16.0.6)
clang++ --version        (16.0.6)
flex --version           (2.6.4)
bison --version          (3.5.1)
make --version           (4.2.1)
```

### 1.3 Build the Project

Run this from the repository root:

```bash
make all
```

Common build targets:

```bash
make help
make llvm-pass
make cgen
make cgen-llvm
make gc-lib
make runtime-lib
make test-gc
```

Build artifacts:

- `app/cgen`: traditional code generator target
- `app/cgen-llvm`: LLVM IR code generator
- `lib/gc/libcoolgc.a`: GC core static library
- `lib/runtime/libruntime.so`: runtime library
- `passes/libCoolModuleSummaryPass.so`: standalone LLVM Pass plugin

`passes/Makefile` automatically scans `passes/*.cpp` and builds a shared library with the same base name for each source file, for example `FooPass.cpp -> libFooPass.so`.
`lib/gc/Makefile` builds only the GC core sources. `lib/runtime/Makefile` builds only the runtime sources and links `lib/gc/libcoolgc.a`; it no longer compiles sources under `lib/gc/` directly.

If you change architecture, LLVM version, or compiler environment, clean and rebuild:

```bash
make clean
make all
```

## 2. Tests

### 2.1 Run GC Tests

```bash
make test-gc
```

This target builds `lib/gc/libcoolgc.a` first, then enters `tests/gc` and runs the GC-specific tests.
The current GC cases cover:

- Explicit root registration and liveness checks
- Collection of unreachable cycles
- Incremental `step` progress through a full collection cycle
- The repair path after a black object points to a newly allocated white object

### 2.2 Run All Unit Tests

```bash
make test-units
```

This target builds `cgen-llvm` and the runtime library first, then enters `tests/unit` and runs executable golden tests.
By default, it discovers and runs 19 `.cl` cases from `tests/unit/cases/`.

### 2.3 Run One Test or a Test Group

```bash
make unit-test example.cl
make unit-test cells.cl
```

`unit-test` supports filtering by file name or keyword.

### 2.4 Run LLVM Pass Tests

```bash
make test-pass
```

This target builds the pass plugins under `passes/`, runs `opt` on `tests/pass/cases/*.input.ll`, and then checks both `.expected.ll` textual output and `.expected.txt` program output.

### 2.5 Build Only the Test Runner

```bash
cd tests/unit
make build
```

### 2.6 Run the Test Runner Directly

```bash
cd tests/unit
./unit_test_runner
./unit_test_runner --filter graph
./unit_test_runner --list
./unit_test_runner --verbose
./unit_test_runner --program-input "q\n"
```

The GC-specific runner can also be executed directly:

```bash
cd tests/gc
make run
```

### 2.7 Inspect Discovered Cases

After adding, moving, or syncing cases, list the tests discovered by the runner before running the full suite:

```bash
cd tests/unit
./unit_test_runner --list
```

If the total count from `--list` does not match your expectation, check:

- Whether the case is under `tests/unit/cases/`
- Whether both `name.cl` and a non-empty `name.expected.txt` exist
- Whether paired files use the same base name

For more detailed case maintenance rules, see `tests/unit/cases/README.md`.

### 2.8 Test Framework Layout

`tests/unit` and `tests/pass` now share the common golden test framework under the `tests/` root:

- `tests/golden_test_framework.h`
- `tests/golden_test_framework.cpp`
- `tests/golden_test_main.cpp`
- `tests/unit_test_suite_main.cpp`

Both suites use the same framework implementation. The `unit` suite additionally has a lightweight wrapper entry point to preserve direct `./unit_test_runner` usage.

`tests/gc` does not reuse this golden framework. It only builds and verifies the GC itself, and calls `lib/gc/Makefile` through `tests/gc/Makefile` to produce the `libcoolgc_test.a` needed by the tests.

### 2.9 Manually Verify the LLVM Generation Path

If you only want to verify that compiler-generated IR can be linked and run:

```bash
cd app
../bin/.i686/lexer ../tests/unit/cases/example.cl \
  | ./parser ../tests/unit/cases/example.cl \
  | ./semant ../tests/unit/cases/example.cl \
  | ./cgen-llvm ../tests/unit/cases/example.cl \
  > ../tests/unit/cases/example.actual.ll

clang++ ../tests/unit/cases/example.actual.ll \
  -L../lib/runtime -lruntime \
  -Wl,-rpath,../lib/runtime \
  -o ../tests/unit/.artifacts/example

../tests/unit/.artifacts/example
```

### 2.10 CI

The repository includes a Gitee Go pipeline configuration at `/.workflow/ci.yml`, currently constrained to Ubuntu 20.04 and LLVM 16.0.6.

The default pipeline runs:

- `scripts/ci/install_ubuntu2004_llvm1606.sh`
- `make all`
- `make runtime-lib`
- `make test-units`
- `make test-pass`

The current configuration uses `shell@agent`, so you need to prepare an Ubuntu 20.04 host group in Gitee Go and replace the `hostGroupID` in `/.workflow/ci.yml` with the actual host group ID.

## 3. Project Details

### 3.1 Project Goal

This is a COOL compiler lab project. Its main goal is to compile COOL programs through lexical, syntax, and semantic analysis, generate LLVM IR, and link a custom runtime library to produce an executable.

### 3.2 Main Directories

- `app/`: compiler programs and LLVM backend implementation
- `bin/.i686/`: course-provided `lexer`, `parser`, `semant`, and related tools
- `lib/runtime/`: runtime library sources and `libruntime.so`
- `lib/gc/`: GC core algorithm sources, GC-specific Makefile, and static library artifacts
- `passes/`: LLVM 16 Pass plugin sources and standalone build scripts
- `scripts/ci/`: Gitee CI dependency installation and build/test scripts
- `tests/gc/`: GC-specific tests and GC test Makefile
- `tests/unit/`: executable-result golden tests
- `tests/unit/cases/`: the 19 executable COOL golden cases currently maintained
- `tests/pass/`: textual regression tests for LLVM Passes
- `tests/llvm_ir/`: handwritten LLVM IR and C mixed-linking examples
- `examples/`: reference COOL example programs; sync them to `tests/unit/cases/` to include them in automatic regression tests
- `doc/`: course materials and lab notes

### 3.3 Top-Level Makefile Targets

- `make all`: build the main compiler targets
- `make cgen`: build the traditional code generator
- `make cgen-llvm`: build the LLVM code generator
- `make gc-lib`: build the GC static library
- `make llvm-pass`: build standalone LLVM Pass plugins
- `make runtime-lib`: build the runtime library
- `make test-gc`: run GC-specific tests
- `make test-units`: run all unit tests
- `make test-pass`: run LLVM Pass textual tests
- `make unit-test <filter>`: run selected tests
- `make dotest`: run the example test and print IR

### 3.4 GC Algorithm Details

The current `lib/gc/` implementation is a non-moving, incrementally advanced tri-color mark-and-sweep collector. The GC state machine is defined by `CoolGCState` and includes:

- `COOL_GC_PAUSE`
- `COOL_GC_PROPAGATE`
- `COOL_GC_ATOMIC`
- `COOL_GC_SWEEP`

#### 3.4.1 Object Model and Color Bits

Each managed object is preceded by a `CoolGCHeader`, which stores:

- Object magic number
- Color bits and state flags
- Payload size and underlying mapping size
- Allocation-list pointers
- Gray-queue pointer

Colors implement the tri-color abstraction:

- Current white: the color used for newly allocated objects in the current round
- Other white: the collection candidate color for the current round
- Gray: discovered but not yet scanned
- Black: fully scanned

When a new GC cycle starts, `current_white` is flipped. Objects left in the previous round's other-white color naturally become collection candidates for the new round, without traversing the whole heap to reset initial colors.

#### 3.4.2 Root Sources

The current implementation supports two root sources:

- Explicitly registered roots: `cool_gc_register_root` / `cool_gc_unregister_root` attach `void**` slots to the root list
- Stack-scanned roots: after recording a stack anchor, the current stack range is conservatively scanned by machine word

Stack root scanning can be disabled with `cool_gc_set_stack_roots_enabled(0)`. GC-specific tests disable stack scanning by default and verify only explicit root behavior, which makes test results more stable and controllable.

#### 3.4.3 Incremental Execution Flow

Each `cool_gc_step()` advances only a limited budget:

- The propagation phase processes at most `COOL_GC_STEP_BUDGET` gray objects
- The sweep phase processes at most `COOL_GC_SWEEP_BUDGET` objects

The flow is roughly:

1. Start a new cycle in `PAUSE`, flip the white color, and rescan roots
2. Enter `PROPAGATE`, repeatedly pop gray objects, scan their payloads for possible references, and turn them black
3. When the gray queue is empty, enter `ATOMIC`, rescan roots and the black heap, and converge remaining references
4. Enter `SWEEP`, incrementally free unreachable white objects by budget, and recolor survivors back to current white
5. Return to `PAUSE` after sweeping completes

In addition to incremental `step`, `cool_gc_force_full()` completes a full stop-the-world heap collection directly. It is useful for tests, runtime shutdown, or fallback under memory pressure.

#### 3.4.4 Black-to-White Reference Repair

The current implementation does not expose a separate write-barrier API, and it does not use card tables or generational remembered sets.
To repair the typical tri-color invariant violation where a black object writes a reference to a new white object during incremental collection, the GC rescans the black object set during incremental progress and the atomic phase:

- `cool_gc_rescan_black_heap()`

This direct repair strategy has higher cost, but it keeps the implementation simple and avoids invasive runtime interfaces. Its drawback is that black-heap rescanning adds overhead to each incremental step.

#### 3.4.5 Pointer Recognition and Scanning

Object scanning is conservative. The GC splits object payloads and stack ranges by machine word, treats each word as a potential pointer, and checks whether it falls inside the valid range of any managed object in the allocation list.

This has two behavioral properties:

- Interior pointers are recognized, so a pointer does not need to refer exactly to the object start address
- Ordinary integers that look like addresses may be misidentified as live references, which can delay collection but will not incorrectly free reachable objects

#### 3.4.6 Managed Objects and Raw Objects

The GC directory maintains two allocation families:

- `cool_gc_malloc` / `cool_gc_calloc` / `cool_gc_free`: GC-managed objects
- `cool_raw_malloc` / `cool_raw_calloc` / `cool_raw_free`: raw blocks that are not traced

Raw blocks have a separate `CoolRawHeader` list and are suitable for:

- Root-node metadata
- String buffers
- Small helper allocations that should not be conservatively scanned

The `CoolString` object body in the runtime is allocated on the GC heap, while its character buffer uses raw allocation. This separates object lifetime from external byte arrays.

#### 3.4.7 Trigger Policy and Thresholds

After initialization, the default GC threshold is `64 KiB`. After each managed allocation, if `total_managed_bytes` reaches the threshold, the collector attempts one incremental step.

After each full collection round, the threshold is updated to:

- `max(64 KiB, live_managed_bytes * 2)`

This simple policy lets the threshold grow with the live set size and avoids overly frequent GC when many objects survive.

#### 3.4.8 Runtime Integration

`lib/runtime/` no longer compiles GC sources directly. It only depends on `lib/gc/`:

- `make gc-lib` builds `libcoolgc.a`
- `runtime-lib` then links that static library

`gc.h` also exports wrapper functions for `malloc` / `calloc` / `free`. This lets generated LLVM IR keep calling standard C allocation symbols while finally landing in the GC implementation.
To prevent GC-specific tests from intercepting host C runtime allocation, `tests/gc` uses `libcoolgc_test.a`, which is built with `COOL_GC_NO_MALLOC_WRAPPERS` and exposes only explicit GC APIs without overriding global `malloc/free`.

#### 3.4.9 Current Limitations

The implementation intentionally keeps several limitations:

- Non-moving, with no compaction
- Non-generational, with all objects in one managed heap list
- Single-threaded, with no concurrent GC
- Black-heap rescanning instead of write barriers, simple but not performance-aggressive
- Conservative stack scanning, which can keep false positives alive

### 3.5 Known Constraints

- `app/Makefile` explicitly requires `llvm-config-16` to be visible in `PATH`.
- The test runner feeds `q\n` to tested programs by default, which helps exit interactive examples.
- The runtime library currently builds a Linux shared library, `libruntime.so`, so native Windows is not recommended as the primary deployment platform.
