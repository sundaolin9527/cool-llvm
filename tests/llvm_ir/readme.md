# Minimal LLVM IR Verification

Simplified Chinese version: [README-zh-CN.md](README-zh-CN.md)

## 1. Setup

This directory verifies whether "handwritten LLVM IR + C object files" can be compiled, linked, and run correctly.
Run it in Linux/WSL, with `gcc` and the LLVM toolchain installed in advance.

Ubuntu / Debian:

```bash
sudo apt-get update
sudo apt-get install -y build-essential llvm-16 clang
```

Make sure the tools are available:

```bash
gcc --version
llc --version
```

## 2. Test

Run this in the current directory:

```bash
gcc -c myfunc.c -o myfunc.o
llc -filetype=obj main.ll -o main.o
gcc -no-pie main.o myfunc.o -o program
./program
```

If you only want to rerun the final step, execute:

```bash
./program
```

## 3. Directory Details

- `main.ll`: handwritten LLVM IR example
- `myfunc.c`: C function called from IR
- `demo.ll`: additional IR example file

This directory does not depend on the repository root `Makefile`, so it is useful for quickly checking whether the LLVM toolchain itself works.
