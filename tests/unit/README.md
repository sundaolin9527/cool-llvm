# 可执行结果单元测试

## 1. 部署

这套测试依赖仓库根目录的编译器和运行时库。开始之前，请先在仓库根目录完成部署：

```bash
make cgen-llvm
make runtime-lib
```

建议环境：

- Linux / WSL
- GNU Make
- `g++` / `clang++`
- `llvm-config-16`
- `bin/.i686/lexer`
- `app/parser`
- `app/semant`
- `app/cgen-llvm`
- `lib/runtime/libruntime.so`

如果你只想构建本目录的测试 runner：

```bash
make build
```

## 2. 测试

### 2.1 运行全部测试

在仓库根目录执行：

```bash
make test-units
```

或在当前目录执行：

```bash
make run
```

### 2.2 运行指定测试

在仓库根目录执行：

```bash
make unit-test example
make unit-test cells.cl
```

在当前目录直接执行：

```bash
./unit_test_runner --filter example
```

### 2.3 查看测试列表或调试命令

```bash
./unit_test_runner --list
./unit_test_runner --verbose
```

## 3. 测试机制

runner 会对每个 `.cl` 用例执行下面三步：

```bash
cd {app_dir} && ../bin/.i686/lexer {input} | ./parser {input} | ./semant {input} | ./cgen-llvm {input}
clang++ {actual_ir} -L{runtime_dir} -lruntime -Wl,-rpath,{runtime_dir} -o {executable}
{executable}
```

判定流程：

1. 读取 `tests/unit/cases` 中的 `.cl` 输入文件
2. 生成 LLVM IR，并写回同名 `.actual.ll`
3. 将 IR 链接成可执行文件
4. 运行可执行文件，并与 `.expected.txt` 做逐行比较

runner 默认向程序标准输入写入 `q\n`，便于退出像 `example.cl` 这样的交互式程序。

## 4. 文件组织

每个测试通常由三类文件组成：

- `xxx.cl`：输入程序
- `xxx.actual.ll`：测试过程中生成或更新的 LLVM IR
- `xxx.expected.txt`：期望输出

测试用例默认来自 `tests/unit/cases`。

## 5. 常用参数

- `--repo-root <path>`：显式指定仓库根目录
- `--cases-dir <path>`：指定测试用例目录
- `--compile-ir-cmd <template>`：自定义 IR 生成命令模板
- `--link-cmd <template>`：自定义链接命令模板
- `--run-cmd <template>`：自定义程序运行命令模板
- `--filter <text>`：按关键字过滤测试
- `--list`：只列出测试，不执行
- `--verbose`：打印每个测试的实际命令
- `--help`：显示帮助
