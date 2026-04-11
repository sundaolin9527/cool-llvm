# COOL Compiler with LLVM Backend

## 1. 部署

### 1.1 推荐环境

本项目当前以 Linux/WSL 为主开发环境，优先在 Ubuntu 20.04+/Debian 12+ 部署。  
如果你在 Windows 上工作，建议直接使用 WSL2；仓库默认依赖 GNU Make、`llvm-config-16` 和 `.so` 运行时库，原生 PowerShell 环境通常无法直接完成构建。

### 1.2 依赖安装

Ubuntu / Debian:

```bash
sudo apt-get update
sudo apt-get install -y build-essential make flex bison clang llvm-16 llvm-16-dev libfl-dev
```

部署前请确认下面几个命令可用：

```bash
llvm-config-16 --version (16.0.6)
clang++ --version        (16.0.6)
flex --version           (2.6.4)
bison --version          (3.5.1)
make --version           (4.2.1)
```

### 1.3 构建项目

在仓库根目录执行：

```bash
make all
```

常用构建目标：

```bash
make help
make llvm-pass
make cgen
make cgen-llvm
make gc-lib
make runtime-lib
make test-gc
```

构建产物说明：

- `app/cgen`：传统代码生成器目标
- `app/cgen-llvm`：LLVM IR 代码生成器
- `lib/gc/libcoolgc.a`：GC 核心静态库
- `lib/runtime/libruntime.so`：运行时库
- `passes/libCoolModuleSummaryPass.so`：独立 LLVM Pass 插件

`passes/Makefile` 会自动扫描 `passes/*.cpp` 并为每个源码生成同名共享库，例如 `FooPass.cpp -> libFooPass.so`。
`lib/gc/Makefile` 单独负责 GC 核心源码的构建；`lib/runtime/Makefile` 只负责运行时自身源码，并链接 `lib/gc/libcoolgc.a`，不再直接编译 `lib/gc/` 下的源码。

如果你切换了架构、LLVM 版本或编译环境，先清理再重建：

```bash
make clean
make all
```

## 2. 测试

### 2.1 运行 GC 专项测试

```bash
make test-gc
```

这个目标会先构建 `lib/gc/libcoolgc.a`，再进入 `tests/gc` 执行 GC 专项测试。  
GC 用例当前覆盖：

- 显式根注册与存活验证
- 不可达环回收
- 增量 `step` 推进到完整回收周期
- 黑对象写入新白对象后的修复路径

### 2.2 运行全部单元测试

```bash
make test-units
```

这个目标会先构建 `cgen-llvm` 和运行时库，再进入 `tests/unit` 执行可执行产物 golden tests。
当前默认会从 `tests/unit/cases/` 发现并执行 19 个 `.cl` 用例。

### 2.3 运行单个或一组测试

```bash
make unit-test example.cl
make unit-test cells.cl
```

`unit-test` 支持按文件名或关键字过滤。

### 2.4 运行 LLVM Pass 测试

```bash
make test-pass
```

这个目标会先构建 `passes/` 下的 pass 插件，再对 `tests/pass/cases/*.input.ll` 执行 `opt`，最后同时校验 `.expected.ll` 文本输出和 `.expected.txt` 运行结果。

### 2.5 仅构建测试 runner

```bash
cd tests/unit
make build
```

### 2.6 直接运行测试 runner

```bash
cd tests/unit
./unit_test_runner
./unit_test_runner --filter graph
./unit_test_runner --list
./unit_test_runner --verbose
./unit_test_runner --program-input "q\n"
```

GC 专项 runner 也可以单独执行：

```bash
cd tests/gc
make run
```

### 2.7 查看已发现用例

当你新增、迁移或同步用例后，建议先列出 runner 实际发现的测试，再决定是否继续跑全量：

```bash
cd tests/unit
./unit_test_runner --list
```

如果 `--list` 输出的总数和你预期不一致，先检查：

- 用例是否位于 `tests/unit/cases/`
- 是否同时存在 `name.cl` 和非空的 `name.expected.txt`
- 文件名是否同名配对

更细的用例维护约定可以参考 `tests/unit/cases/README.md`。

### 2.8 测试框架组织

`tests/unit` 和 `tests/pass` 现在共用 `tests/` 根目录下的通用 golden 测试框架：

- `tests/golden_test_framework.h`
- `tests/golden_test_framework.cpp`
- `tests/golden_test_main.cpp`
- `tests/unit_test_suite_main.cpp`

两个 suite 共用同一套框架实现；`unit` 额外有一个轻量包装入口用于保留 `./unit_test_runner` 的直接使用方式。

`tests/gc` 不复用这套 golden 框架，它只负责 GC 自身的构建与运行验证，并通过 `tests/gc/Makefile` 调用 `lib/gc/Makefile` 生成测试所需的 `libcoolgc_test.a`。

### 2.9 手动验证 LLVM 生成链路

如果你只想验证编译器输出的 IR 能否链接运行：

```bash
cd app
../bin/.i686/lexer ../tests/unit/cases/example.cl \
  | ./parser ../tests/unit/cases/example.cl \
  | ./semant ../tests/unit/cases/example.cl \
  | ./cgen-llvm ../tests/unit/cases/example.cl \
  > ../tests/unit/cases/example.actual.ll

clang++ ../tests/unit/cases/example.actual.ll \
  -L../lib/runtime -lruntime \
  -Wl,-rpath,../lib/runtime \
  -o ../tests/unit/.artifacts/example

../tests/unit/.artifacts/example
```

### 2.10 CI

仓库已经提供 Gitee Go 流水线配置 `/.workflow/ci.yml`，当前按 Ubuntu 20.04 + LLVM 16.0.6 约束执行。

默认流水线会调用：

- `scripts/ci/install_ubuntu2004_llvm1606.sh`
- `make all`
- `make runtime-lib`
- `make test-units`
- `make test-pass`

当前配置使用 `shell@agent`，因此需要在 Gitee Go 中准备一个 Ubuntu 20.04 主机组，并把 `/.workflow/ci.yml` 里的 `hostGroupID` 改成你实际的主机组 ID。

## 3. 项目细节

### 3.1 项目目标

这是一个 COOL 编译器实验项目，核心目标是把 COOL 程序经过词法、语法、语义分析后，生成 LLVM IR，并链接自定义运行时库得到可执行文件。

### 3.2 主要目录

- `app/`：编译器主程序与 LLVM 后端实现
- `bin/.i686/`：课程提供的 `lexer`、`parser`、`semant` 等工具链
- `lib/runtime/`：运行时库源码与 `libruntime.so`
- `lib/gc/`：GC 核心算法源码、GC 专属 Makefile 与静态库产物
- `passes/`：LLVM 16 Pass 插件源码与独立构建脚本
- `scripts/ci/`：Gitee CI 依赖安装与构建测试脚本
- `tests/gc/`：GC 专项测试与 GC 测试专属 Makefile
- `tests/unit/`：可执行结果 golden tests
- `tests/unit/cases/`：当前实际维护的 19 个可执行 COOL golden case
- `tests/pass/`：LLVM Pass 的文本回归测试
- `tests/llvm_ir/`：手工 LLVM IR / C 混合链接示例
- `examples/`：参考 COOL 示例程序；如果需要纳入自动回归，请同步到 `tests/unit/cases/`
- `doc/`：课程资料与实验记录

### 3.3 顶层 Makefile 目标

- `make all`：构建主要编译目标
- `make cgen`：构建传统代码生成器
- `make cgen-llvm`：构建 LLVM 代码生成器
- `make gc-lib`：构建 GC 静态库
- `make llvm-pass`：构建独立 LLVM Pass 插件
- `make runtime-lib`：构建运行时库
- `make test-gc`：运行 GC 专项测试
- `make test-units`：运行全部单元测试
- `make test-pass`：运行 LLVM Pass 文本测试
- `make unit-test <filter>`：运行指定测试
- `make dotest`：运行example测试并打印IR

### 3.4 GC 算法细节

当前 `lib/gc/` 实现的是一个非移动、增量推进的三色标记清扫回收器，GC 状态机定义在 `CoolGCState` 中，包含：

- `COOL_GC_PAUSE`
- `COOL_GC_PROPAGATE`
- `COOL_GC_ATOMIC`
- `COOL_GC_SWEEP`

#### 3.4.1 对象模型与颜色位

每个受管对象前面都有一个 `CoolGCHeader`，记录：

- 对象魔数
- 颜色位与状态标记
- 载荷大小与底层映射大小
- 分配链表指针
- 灰色队列指针

颜色采用三色抽象实现：

- 当前白色：本轮新分配对象所在颜色
- 另一白色：本轮待回收候选颜色
- 灰色：已发现但尚未扫描引用
- 黑色：已扫描完成

每次启动新一轮 GC 时，会翻转 `current_white`。这样上一轮留下的“另一种白色”自然就成为本轮可回收候选，无需遍历整堆给所有对象重置初始颜色。

#### 3.4.2 根集合来源

当前实现同时支持两类根：

- 显式注册根：通过 `cool_gc_register_root` / `cool_gc_unregister_root` 把 `void**` 槽位挂入根链表
- 栈扫描根：记录栈锚点后，按机器字宽对当前栈区间做保守扫描

其中栈根扫描可以通过 `cool_gc_set_stack_roots_enabled(0)` 关闭。GC 专项测试默认关闭栈扫描，只验证显式根行为，这样测试结果更稳定也更可控。

#### 3.4.3 增量执行流程

`cool_gc_step()` 每次只推进有限预算：

- 传播阶段最多处理 `COOL_GC_STEP_BUDGET` 个灰对象
- 清扫阶段最多处理 `COOL_GC_SWEEP_BUDGET` 个对象

大致流程如下：

1. 在 `PAUSE` 状态启动新周期，翻转白色并重新扫描根集合
2. 进入 `PROPAGATE`，不断弹出灰对象，扫描其载荷中的潜在引用，再把对象染成黑色
3. 当灰队列清空后进入 `ATOMIC`，再次扫描根和黑堆，收敛剩余引用
4. 进入 `SWEEP`，按预算增量释放不可达白对象，并把存活对象重新染回当前白色
5. 清扫完成后回到 `PAUSE`

除了增量 `step` 外，还提供 `cool_gc_force_full()`，会直接完成一次完整的 stop-the-world 全堆回收，适合测试、关闭运行时或内存压力过大时兜底使用。

#### 3.4.4 黑到白引用修复策略

当前实现没有单独暴露写屏障 API，也没有使用卡表或分代 remembered set。  
为了修复“黑对象在增量过程中写入新白对象”这一典型三色不变式破坏场景，GC 在增量推进和原子阶段都会重新扫描黑色对象集合：

- `cool_gc_rescan_black_heap()`

这是一种更直接但成本较高的修复策略，优点是实现简单、接口侵入性低，缺点是黑堆重扫会增加每个增量步的额外开销。

#### 3.4.5 指针识别与扫描方式

对象扫描是保守式的。GC 会把对象载荷和栈区间按机器字宽切分，把每个字值都当作潜在指针，再到分配链表里查找它是否落在某个受管对象的有效范围内。

这带来两个行为特征：

- 允许识别落在对象内部的 interior pointer，而不要求必须正好指向对象起始地址
- 可能把“看起来像地址的普通整数”误判为存活引用，从而延迟回收，但不会错误释放仍可达对象

#### 3.4.6 受管对象与原始对象分离

GC 目录里同时维护两套分配：

- `cool_gc_malloc` / `cool_gc_calloc` / `cool_gc_free`：受 GC 管理的对象
- `cool_raw_malloc` / `cool_raw_calloc` / `cool_raw_free`：不参与追踪的原始块

原始块带有独立的 `CoolRawHeader` 链表，适合放：

- 根节点元数据
- 字符串缓冲区
- 其他不希望被保守扫描误处理的小块辅助内存

运行时里的 `CoolString` 对象本体走 GC 堆，而其字符缓冲区走 raw 分配，就是为了把对象生命周期和外部字节数组区分开。

#### 3.4.7 触发策略与阈值

GC 初始化后默认阈值为 `64 KiB`。每次受管分配完成后，如果 `total_managed_bytes` 达到阈值，就会尝试推进一次增量 GC。

每轮完整回收结束后，阈值会更新为：

- `max(64 KiB, live_managed_bytes * 2)`

这种策略比较简单，目标是让阈值随存活集规模自适应增长，避免对象较多时过于频繁地触发 GC。

#### 3.4.8 与运行时的集成方式

`lib/runtime/` 现在不再直接编译 GC 源码，而是只包含对 `lib/gc/` 的依赖：

- 构建期由 `make gc-lib` 先生成 `libcoolgc.a`
- `runtime-lib` 再链接该静态库

同时，`gc.h` 还导出了 `malloc` / `calloc` / `free` 包装函数。这样生成的 LLVM IR 仍然可以调用标准 C 分配符号，但最终会落到 GC 实现上。  
为了避免 GC 专项测试拦截宿主 C 运行时分配，`tests/gc` 使用 `libcoolgc_test.a`，其构建时会定义 `COOL_GC_NO_MALLOC_WRAPPERS`，只暴露显式 GC API，不覆盖全局 `malloc/free`。

#### 3.4.9 当前限制

当前实现仍然有一些刻意保留的限制：

- 非移动式，不做压缩整理
- 非分代式，所有对象位于同一受管堆链表
- 单线程设计，没有并发 GC
- 黑堆重扫替代写屏障，简单但性能上不算激进
- 栈扫描是保守扫描，可能产生误保活

### 3.5 已知约束

- `app/Makefile` 明确要求 `llvm-config-16` 在 PATH 中可见。
- 测试 runner 默认会给被测程序输入 `q\n`，便于退出交互式示例。
- 运行时库当前生成 Linux 共享库 `libruntime.so`，因此不建议把原生 Windows 作为首选部署平台。
