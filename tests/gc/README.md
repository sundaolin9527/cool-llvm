# GC 运行时测试

这个目录只负责 GC 自身的测试用例与测试构建，不承担 `tests/unit` 或 `lib/runtime` 的构建职责。

## 1. 构建与运行

在当前目录执行：

```bash
make run
```

如果只想构建可执行文件：

```bash
make build
```

## 2. 依赖关系

- GC 实现源码与构建入口：`lib/gc/`
- GC 测试源码：`tests/gc/gc_runtime_test.c`
- GC 测试构建入口：`tests/gc/Makefile`

本目录会通过 `lib/gc/Makefile` 生成 `libcoolgc_test.a`，然后再链接本目录下的测试可执行文件。

## 3. 覆盖范围

- 显式根保活
- 不可达环回收
- 增量 step 推进
- 黑对象写入新白对象后的修复路径
