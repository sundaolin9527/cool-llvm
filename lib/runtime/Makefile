CC = gcc
CFLAGS = -Wall -Wextra -O2 -fPIC
CFLAGS += -DCOOL_RUNTIME_EXPORT
CFLAGS += -fvisibility=hidden
CFLAGS += -Wno-unused-parameter -Wno-unused-function

TARGET = libruntime.so
SRCS = runtime.c
OBJS = $(SRCS:.c=.o)

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) -shared -o $@ $(OBJS)

%.o: %.c runtime.h
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS)

# 查看导出的符号
exports:
	nm -D $(TARGET) | grep " T " | grep -E "Object_|IO_|String_|Int_|Bool_" || echo "No symbols found"

.PHONY: all clean exports
