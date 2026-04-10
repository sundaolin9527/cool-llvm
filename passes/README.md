# LLVM Pass Development

这个目录用于存放当前项目的独立 LLVM Pass 插件源码和构建文件。

## 目录约定

- `*.cpp`：每个源文件对应一个独立 LLVM 16 Pass 插件
- `Makefile`：自动发现当前目录下所有 `.cpp`，并生成对应的 `.so` 插件

## 当前 pass

当前示例 pass 名称为 `cool-module-summary`，源码位于 `CoolModuleSummaryPass.cpp`，基于 LLVM 16 的 New Pass Manager。
它会扫描模块中的已定义函数，并向模块写入一段命名元数据：

```llvm
!cool.module.summary = !{!0}
!0 = !{!"cool-module-summary", i32 <defined_function_count>}
```

这个行为足够稳定，便于后续做文本测试，也方便你把它替换成真正业务 pass。

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
  -load-pass-plugin ./libCoolModuleSummaryPass.so \
  -passes=cool-module-summary \
  -S ../tests/pass/cases/basic.input.ll \
  -o /tmp/basic.actual.ll
```
