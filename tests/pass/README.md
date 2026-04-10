# LLVM Pass Tests

这个目录专门放独立 LLVM Pass 的文本回归测试，不依赖运行整个 COOL 编译器链路。

## 目录约定

- `cases/*.input.ll`：pass 输入 IR
- `cases/*.expected.ll`：期望输出
- `cases/*.actual.ll`：测试运行时生成的实际输出
- `Makefile`：构建 pass 插件并执行文本比对

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

最后用 `diff -u` 比较 `.expected.ll` 和 `.actual.ll`。

如果后续新增其他 pass，也可以在执行时覆盖变量：

```bash
make run PASS_PLUGIN=../../passes/libMyAnalysisPass.so PASS_PIPELINE=my-analysis-pass
```
