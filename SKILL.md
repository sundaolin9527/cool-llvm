1. 当前目录以及子目录所有权限全部给你，其他目录只给你只读权限，不要总是问我要权限；
2. 在E:\cool-llvm\passes 目录开发以下pass，并在E:\cool-llvm\tests\pass\cases 下补充最小测试用例，使得在E:\cool-llvm\ 下执行make test-pass能通过；以下7种pass每种pass开发一个，并在代码中加入中文注释和方案。每种pass对应一个测试，使用测试驱动开发的方式。
Pass类型	作用范围	开发实例功能	实例名称 (建议)	核心挑战
ModulePass	整个模块 (.c文件)	全局死代码消除：移除未使用的全局变量、函数和别名。	GlobalDeadCodeElim	构建全局引用图，处理间接调用和 @llvm.used 特殊属性。
CallGraphSCCPass	调用图的强连通分量 (SCC)	过程间常量传播：将函数参数替换为常量，简化函数体。	Inter proceduralConstantProp	理解SCC遍历顺序，处理递归调用，更新所有调用点。
FunctionPass	单个函数	冗余位宽缩减：将整型运算安全替换为更窄的位宽运算。	RedundantWidthReduction	进行活跃位域数据流分析，正确处理 PHI 节点。
LoopPass	单个循环	智能循环展开：基于迭代次数自动决策最优展开因子并执行。	SmartLoopUnroll	结合 ScalarEvolution 分析Trip Count，评估收益并正确连接PHI节点。
RegionPass	单入单出(SESE)区域	区域指令重排：基于依赖图(DAG)重排指令，利于并行或减少寄存器压力。	RegionBasedInstrReordering	构建并调度依赖DAG，处理内存依赖（需别名分析）和边界PHI节点。
BasicBlockPass	单个基本块	本地针孔优化：匹配并简化冗余指令模式（如 (X<<C1)>>C2）。	LocalPinholeOptimization	设计高效的模式匹配引擎，处理操作数的交换律，并迭代优化。
MachineFunctionPass	后端 Machine IR 函数	寄存器爆裂探测：分析活跃变量，报告可能频繁溢出/填充的区域。	RegSpillDetector	操作Machine IR，进行活跃度分析，并适配目标机器的寄存器数量。
3. 当前项目是不具备直接运行的条件，不要在运行环境上浪费时间。