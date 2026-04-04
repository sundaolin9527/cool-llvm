# 用例目录

把 `.cl` 输入文件和对应的 `.expected.ll` 放到这里。

命名示例：

- `arith.cl`
- `arith.expected.ll`

runner 会自动递归扫描这个目录，并把同名文件配对成一个 IR golden test。
