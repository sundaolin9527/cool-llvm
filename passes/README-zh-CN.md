# LLVM Pass Development

这个目录用于存放当前项目的独立 LLVM Pass 插件源码和构建文件。

## 目录约定

- `*.cpp`：每个源文件对应一个独立 LLVM 16 Pass 插件
- `Makefile`：自动发现当前目录下所有 `.cpp`，并生成对应的 `.so` 插件

## 当前 pass

当前目录保留了一个示例 pass `CoolModuleSummaryPass.cpp`，同时新增了 7 个与作业要求对应的 pass：

- `GlobalDeadCodeElimPass.cpp`
- `InterProceduralConstantPropPass.cpp`
- `RedundantWidthReductionPass.cpp`
- `SmartLoopUnrollPass.cpp`
- `RegionBasedInstrReorderingPass.cpp`
- `LocalPinholeOptimizationPass.cpp`
- `RegSpillDetectorPass.cpp`

这些 pass 都基于 LLVM 16 的 New Pass Manager 插件接口实现，测试时按 case 单独加载对应 `.so` 和 pipeline。

其中 `RegSpillDetectorPass` 由于当前测试链路停在 `opt`/LLVM IR，没有真正进入 Machine IR，因此采用了“IR 级活跃值近似寄存器压力”的前置探测方案，并把结果写入命名元数据。

## 构建

在仓库根目录执行：

```bash
make llvm-pass
```

或在当前目录执行：

```bash
make
```

只要把新的 pass 源码文件放进当前目录，例如 `MyAnalysisPass.cpp`，执行 `make` 时就会自动额外产出 `libMyAnalysisPass.so`，不需要修改 `Makefile`。

## 手动验证

如果环境里有 `opt-16`，可以直接对任意 `.ll` 文件运行：

```bash
opt-16 \
  -load-pass-plugin ./libGlobalDeadCodeElimPass.so \
  -passes=global-dead-code-elim \
  -S ../tests/pass/cases/basic.input.ll \
  -o /tmp/basic.actual.ll
```
