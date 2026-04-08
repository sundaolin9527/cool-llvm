1. 当前目录是 ./，当前目录下的所有权限全部给你，不要总是问我要权限，其他目录只给你只读权限，
目前是没有运行环境的，不要在环境上耗费时间；
2. ./tests/unit/cases/example.cl 生成的 IR 如 ./tests/unit/cases/example.expected.ll, 
   构建方式见./tests/unit/cases/README.md 中的# 编译 example 用例，构建产物是./tests/unit/cases/example,
   运行./example 报以下错误：
    sun@sun-PowerEdge-R630:/opt/sundaolin/cool/tests/unit/cases$ ./example 
    number 0 is even!
    Class type is now A

            To add a number to 0 ...enter a:
            To negate 0 ...enter b:
            To find the difference between 0 and another number...enter c:
            To find the factorial of 0 ...enter d:
            To square 0 ...enter e:
            To cube 0 ...enter f:
            To find out if 0 is a multiple of 3...enter g:
            To divide 0 by 8...enter h:
            To get a new number...enter j:
            To quit...enter q:


    Segmentation fault
   请解决这个段错误的问题；

3. 当前生成的 IR 中的字段是没有考虑对齐的，例如，
    %class.Object.0 = type { ptr } 
    %class.Bool = type { %class.Object.0, i1 }，
    请按8字节对齐，并同步修改 lib/runtime 下的内容；
4. ./cool/tests/unit/ 这个测试逻辑不完善，不应该比较生成的IR 是否和预期IR 一致，应该比较生成的example可执行文件功能  是否和预期值一致，./cool/tests/unit/cases 目录最终生成的内容结构如下：
./cool/tests/unit/cases
   example.cl            # 输入脚本
   example.actual.ll     # 输入脚本生成的IR
   example.expected.txt  # 期待的输出
5. 如果需要用到gc算法，gc算法的实现放在lib/gc下面，具体实现参考luajit实现，详见xxx
   
   