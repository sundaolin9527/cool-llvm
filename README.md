# COOL Compiler with LLVM Backend

## 1. 部署

### 1.1 推荐环境

本项目当前以 Linux/WSL 为主开发环境，优先在 Ubuntu 20.04+/Debian 12+ 部署。  
如果你在 Windows 上工作，建议直接使用 WSL2；仓库默认依赖 GNU Make、`llvm-config-16` 和 `.so` 运行时库，原生 PowerShell 环境通常无法直接完成构建。

### 1.2 依赖安装

Ubuntu / Debian:

```bash
sudo apt-get update
sudo apt-get install -y build-essential make flex bison clang llvm-16 llvm-16-dev libfl-dev
```

部署前请确认下面几个命令可用：

```bash
llvm-config-16 --version (16.0.6)
clang++ --version        (16.0.6)
flex --version           (2.6.4)
bison --version          (3.5.1)
make --version           (4.2.1)
```

### 1.3 构建项目

在仓库根目录执行：

```bash
make all
```

常用构建目标：

```bash
make help
make llvm-pass
make cgen
make cgen-llvm
make runtime-lib
```

构建产物说明：

- `app/cgen`：传统代码生成器目标
- `app/cgen-llvm`：LLVM IR 代码生成器
- `lib/runtime/libruntime.so`：运行时库
- `passes/libCoolModuleSummaryPass.so`：独立 LLVM Pass 插件

`passes/Makefile` 会自动扫描 `passes/*.cpp` 并为每个源码生成同名共享库，例如 `FooPass.cpp -> libFooPass.so`。
`lib/runtime/Makefile` 会同时编译 `lib/runtime/` 和 `lib/gc/` 下的源码，并把 GC 核心实现一起链接进 `libruntime.so`。

如果你切换了架构、LLVM 版本或编译环境，先清理再重建：

```bash
make clean
make all
```

## 2. 测试

### 2.1 运行全部单元测试

```bash
make test-units
```

这个目标会先构建 `cgen-llvm` 和运行时库，再进入 `tests/unit` 执行可执行产物 golden tests。
当前默认会从 `tests/unit/cases/` 发现并执行 19 个 `.cl` 用例。

### 2.2 运行单个或一组测试

```bash
make unit-test example.cl
make unit-test cells.cl
```

`unit-test` 支持按文件名或关键字过滤。

### 2.3 运行 LLVM Pass 测试

```bash
make test-pass
```

这个目标会先构建 `passes/` 下的 pass 插件，再对 `tests/pass/cases/*.input.ll` 执行 `opt`，最后同时校验 `.expected.ll` 文本输出和 `.expected.txt` 运行结果。

### 2.4 仅构建测试 runner

```bash
cd tests/unit
make build
```

### 2.5 直接运行测试 runner

```bash
cd tests/unit
./unit_test_runner
./unit_test_runner --filter graph
./unit_test_runner --list
./unit_test_runner --verbose
./unit_test_runner --program-input "q\n"
```

### 2.6 查看已发现用例

当你新增、迁移或同步用例后，建议先列出 runner 实际发现的测试，再决定是否继续跑全量：

```bash
cd tests/unit
./unit_test_runner --list
```

如果 `--list` 输出的总数和你预期不一致，先检查：

- 用例是否位于 `tests/unit/cases/`
- 是否同时存在 `name.cl` 和非空的 `name.expected.txt`
- 文件名是否同名配对

更细的用例维护约定可以参考 `tests/unit/cases/README.md`。

### 2.7 测试框架组织

`tests/unit` 和 `tests/pass` 现在共用 `tests/` 根目录下的通用 golden 测试框架：

- `tests/golden_test_framework.h`
- `tests/golden_test_framework.cpp`
- `tests/golden_test_main.cpp`
- `tests/unit_test_suite_main.cpp`

两个 suite 共用同一套框架实现；`unit` 额外有一个轻量包装入口用于保留 `./unit_test_runner` 的直接使用方式。

### 2.8 手动验证 LLVM 生成链路

如果你只想验证编译器输出的 IR 能否链接运行：

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

### 2.9 CI

仓库已经提供 Gitee Go 流水线配置 `/.workflow/ci.yml`，当前按 Ubuntu 20.04 + LLVM 16.0.6 约束执行。

默认流水线会调用：

- `scripts/ci/install_ubuntu2004_llvm1606.sh`
- `make all`
- `make runtime-lib`
- `make test-units`
- `make test-pass`

当前配置使用 `shell@agent`，因此需要在 Gitee Go 中准备一个 Ubuntu 20.04 主机组，并把 `/.workflow/ci.yml` 里的 `hostGroupID` 改成你实际的主机组 ID。

## 3. 项目细节

### 3.1 项目目标

这是一个 COOL 编译器实验项目，核心目标是把 COOL 程序经过词法、语法、语义分析后，生成 LLVM IR，并链接自定义运行时库得到可执行文件。

### 3.2 主要目录

- `app/`：编译器主程序与 LLVM 后端实现
- `bin/.i686/`：课程提供的 `lexer`、`parser`、`semant` 等工具链
- `lib/runtime/`：运行时库源码与 `libruntime.so`
- `lib/gc/`：GC 核心算法实现，当前运行时会从这里链接垃圾回收逻辑
- `passes/`：LLVM 16 Pass 插件源码与独立构建脚本
- `scripts/ci/`：Gitee CI 依赖安装与构建测试脚本
- `tests/unit/`：可执行结果 golden tests
- `tests/unit/cases/`：当前实际维护的 19 个可执行 COOL golden case
- `tests/pass/`：LLVM Pass 的文本回归测试
- `tests/llvm_ir/`：手工 LLVM IR / C 混合链接示例
- `examples/`：参考 COOL 示例程序；如果需要纳入自动回归，请同步到 `tests/unit/cases/`
- `doc/`：课程资料与实验记录

### 3.3 顶层 Makefile 目标

- `make all`：构建主要编译目标
- `make cgen`：构建传统代码生成器
- `make cgen-llvm`：构建 LLVM 代码生成器
- `make llvm-pass`：构建独立 LLVM Pass 插件
- `make runtime-lib`：构建运行时库
- `make test-units`：运行全部单元测试
- `make test-pass`：运行 LLVM Pass 文本测试
- `make unit-test <filter>`：运行指定测试
- `make dotest`：运行example测试并打印IR

### 3.4 已知约束

- `app/Makefile` 明确要求 `llvm-config-16` 在 PATH 中可见。
- 测试 runner 默认会给被测程序输入 `q\n`，便于退出交互式示例。
- 运行时库当前生成 Linux 共享库 `libruntime.so`，因此不建议把原生 Windows 作为首选部署平台。
