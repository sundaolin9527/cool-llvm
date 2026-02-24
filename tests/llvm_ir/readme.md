# 编译C文件
gcc -c myfunc.c -o myfunc.o

# 编译IR文件
llc -filetype=obj main.ll -o main.o

# 链接
gcc -no-pie main.o myfunc.o -o program

# 运行
./program