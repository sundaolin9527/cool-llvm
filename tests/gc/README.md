# GC Runtime Tests

Simplified Chinese version: [README-zh-CN.md](README-zh-CN.md)

This directory is responsible only for GC-specific test cases and test builds. It does not build `tests/unit` or `lib/runtime`.

## 1. Build and Run

Run this in the current directory:

```bash
make run
```

To build only the executable:

```bash
make build
```

## 2. Dependencies

- GC implementation sources and build entry point: `lib/gc/`
- GC test source: `tests/gc/gc_runtime_test.c`
- GC test build entry point: `tests/gc/Makefile`

This directory uses `lib/gc/Makefile` to build `libcoolgc_test.a`, then links the test executable in this directory.

## 3. Coverage

- Explicit roots keeping objects alive
- Collection of unreachable cycles
- Incremental step progress
- The repair path after a black object points to a newly allocated white object
