CC = gcc
CFLAGS = -Wall -Wextra -O2
CFLAGS += -DCOOL_RUNTIME_EXPORT
CFLAGS += -fvisibility=hidden
CFLAGS += -Wno-unused-parameter -Wno-unused-function
CFLAGS += -I. -I../gc

TARGET = libruntime.so
GC_LIB = ../gc/libcoolgc.a
SRCS = runtime.c
OBJS = runtime.o

ifeq ($(OS),Windows_NT)
RM_FILES = cmd /c "if exist runtime.o del /q /f runtime.o & if exist $(TARGET) del /q /f $(TARGET)" 2>nul
else
RM_FILES = rm -f $(OBJS) $(TARGET)
endif

all: $(TARGET)

$(TARGET): $(OBJS) $(GC_LIB)
	$(CC) -shared -o $@ $(OBJS) $(GC_LIB)

$(GC_LIB):
	@echo "Missing $(GC_LIB). Build it first with: make -C ../gc all"
	@false

%.o: %.c runtime.h
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	-$(RM_FILES)

# 查看导出的符号
exports:
	nm -D $(TARGET) | grep " T " | grep -E "Object_|IO_|String_|Int_|Bool_" || echo "No symbols found"

.PHONY: all clean exports
