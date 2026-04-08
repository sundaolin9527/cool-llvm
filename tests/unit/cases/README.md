# 用例目录

把 `.cl` 输入文件和对应的 `.expected.ll` 放到这里。

命名示例：

- `example.cl`
- `example.expected.ll`

runner 会自动递归扫描这个目录，并把同名文件配对成一个 IR golden test。
从仓库根目录可用 `make test-units` 运行全部用例，或用 `make unit-test arith.cl` 只运行单个用例。

# 编译 example 用例
clang++ example.expected.ll \
    -L/opt/sundaolin/cool/lib/runtime \
    -lruntime \
    -Wl,-rpath,/opt/sundaolin/cool/lib/runtime \
    -o example

# 运行
./example