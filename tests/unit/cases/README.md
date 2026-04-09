# 单元测试用例目录

## 1. 部署

新增或维护本目录用例前，先保证仓库根目录已经完成基础构建：

```bash
make cgen-llvm
make runtime-lib
```

如果你只是维护期望输出文件，不需要单独部署别的内容；如果你要本地验证新增用例，至少需要：

- `app/cgen-llvm`
- `app/parser`
- `app/semant`
- `bin/.i686/lexer`
- `lib/runtime/libruntime.so`

## 2. 测试

### 2.1 运行全部用例

```bash
make test-units
```

### 2.2 运行单个用例

```bash
make unit-test example.cl
make unit-test cells.cl
```

### 2.3 手动验证单个用例

以 `example.cl` 为例：

```bash
cd ../../../app
../bin/.i686/lexer ../tests/unit/cases/example.cl \
  | ./parser ../tests/unit/cases/example.cl \
  | ./semant ../tests/unit/cases/example.cl \
  | ./cgen-llvm ../tests/unit/cases/example.cl \
  > ../tests/unit/cases/example.actual.ll

clang++ ../tests/unit/cases/example.actual.ll \
  -L../lib/runtime -lruntime \
  -Wl,-rpath,../lib/runtime \
  -o ../tests/unit/.artifacts/example

printf 'q\n' | ../tests/unit/.artifacts/example
```

如果程序是非交互式的，可以直接运行生成的可执行文件，不必输入 `q\n`。

## 3. 用例格式

每个测试至少应包含以下文件：

- `name.cl`：输入的 COOL 程序
- `name.expected.txt`：程序标准输出的期望结果

测试执行后通常还会生成：

- `name.actual.ll`：由 `cgen-llvm` 生成的 LLVM IR

以 `example` 用例为例：

- `example.cl`
- `example.actual.ll`
- `example.expected.txt`

## 4. 维护约定

- `.expected.txt` 只保存最终程序输出，不要混入调试日志。
- `.actual.ll` 是生成产物，可以保留用于排查问题，但它的内容应该由测试流程更新，而不是手工长期维护。
- 新增交互式程序时，注意 runner 默认只提供 `q\n` 这一段输入；如果程序需要更多输入，建议调整 runner 命令模板或单独手工验证。
