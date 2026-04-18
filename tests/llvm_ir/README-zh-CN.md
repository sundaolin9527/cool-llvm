# LLVM IR 最小验证

## 1. 部署

这个目录用于验证“手写 LLVM IR + C 目标文件”能否被正常编译、链接和运行。
建议在 Linux/WSL 中执行，提前安装 `gcc` 和 LLVM 工具链。

Ubuntu / Debian:

```bash
sudo apt-get update
sudo apt-get install -y build-essential llvm-16 clang
```

确认工具可用：

```bash
gcc --version
llc --version
```

## 2. 测试

在当前目录执行：

```bash
gcc -c myfunc.c -o myfunc.o
llc -filetype=obj main.ll -o main.o
gcc -no-pie main.o myfunc.o -o program
./program
```

如果只想重跑最后一步，也可以直接执行：

```bash
./program
```

## 3. 目录细节

- `main.ll`：手写 LLVM IR 示例
- `myfunc.c`：由 IR 调用的 C 函数
- `demo.ll`：额外的 IR 示例文件

这个目录不依赖仓库根目录的 `Makefile`，适合快速排查 LLVM 工具链本身是否可用。
