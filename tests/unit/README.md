# IR 单元测试框架

这个目录提供一个独立的 C++ golden-file 测试 runner，用来做下面这件事：

1. 发现 `tests/unit/case` 里的 `.cl` 用例
2. 调用 COOL 到 LLVM IR 的编译命令
3. 读取同名 `.expected.ll`
4. 做文本比对并输出失败位置

## 用例约定

- 输入文件：`xxx.cl`
- 期望 IR：`xxx.expected.ll`
- 推荐放在 `tests/unit/case` 或它的子目录里
- runner 也兼容旧目录名 `tests/unit/cases`

## 默认编译命令

runner 默认会使用下面这条模板命令：

```sh
cd {app_dir} && ../bin/.i686/lexer {input} | ./parser {input} | ./semant {input} | ./cgen {input}
```

它依赖 `app/parser`、`app/semant`、`app/cgen` 已经被构建好。
这条链路和 `make dotest` 使用的是同一套前端/代码生成流程，只是把输出抓成 golden-file 对比。

## 构建

```sh
make build
```

## 运行

```sh
make run
```

或者直接执行：

```sh
./ir_golden_test_runner --filter smoke
```

也可以从仓库根目录使用统一入口：

```sh
make test-units
make unit-test example.cl
```

## 常用参数

- `--repo-root <path>`：手工指定仓库根目录
- `--cases-dir <path>`：手工指定用例目录
- `--compiler-cmd <template>`：覆盖默认编译命令模板
- `--filter <text>`：只运行匹配的用例
- `--list`：仅列出发现到的用例
- `--verbose`：打印每个用例实际执行的命令
