# LLVM Pass Tests

这个目录专门放独立 LLVM Pass 的回归测试，使用 `tests/` 根目录下的通用 golden 测试框架。

## 目录约定

- `cases/*.input.ll`：pass 输入 IR
- `cases/*.expected.ll`：期望的 pass 文本输出
- `cases/*.actual.ll`：测试运行时生成的实际输出
- `cases/*.expected.txt`：变换后程序标准输出的期望结果
- `Makefile`：构建 pass 插件并调用公共测试 runner

## 运行方式

在仓库根目录执行：

```bash
make test-pass
```

或在当前目录执行：

```bash
make run
```

## 测试机制

测试会先构建 `passes/libCoolModuleSummaryPass.so`，然后使用 `opt` 执行：

```bash
opt -load-pass-plugin ../../passes/libCoolModuleSummaryPass.so \
    -passes=cool-module-summary -S cases/basic.input.ll -o cases/basic.actual.ll
```

随后会继续把 `.actual.ll` 链接成可执行文件并运行，最后同时校验：

- `.expected.ll` 与 `.actual.ll` 的文本内容
- `.expected.txt` 与程序标准输出

如果后续新增其他 pass，也可以在执行时覆盖变量：

```bash
make run PASS_PLUGIN=../../passes/libMyAnalysisPass.so PASS_PIPELINE=my-analysis-pass
```
