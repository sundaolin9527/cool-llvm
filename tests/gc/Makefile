CC ?= gcc
CFLAGS ?= -std=c11 -O2 -Wall -Wextra -pedantic -Wno-unused-function

TARGET := gc_runtime_test_runner
GC_TEST_LIB := ../../lib/gc/libcoolgc_test.a
OBJS := gc_runtime_test.o

ifeq ($(OS),Windows_NT)
RM_FILES = cmd /c "if exist $(TARGET) del /q /f $(TARGET) & if exist $(TARGET).exe del /q /f $(TARGET).exe & if exist gc_runtime_test.o del /q /f gc_runtime_test.o" 2>nul
else
RM_FILES = rm -f $(TARGET) $(OBJS)
endif

.PHONY: build rebuild run clean

build: $(TARGET)

rebuild: clean build

run: $(TARGET)
	./$(TARGET)

$(TARGET): $(OBJS) $(GC_TEST_LIB)
	$(CC) $(CFLAGS) $(OBJS) $(GC_TEST_LIB) -o $(TARGET)

$(GC_TEST_LIB):
	$(MAKE) -C ../../lib/gc testlib

gc_runtime_test.o: gc_runtime_test.c ../../lib/gc/gc.h
	$(CC) $(CFLAGS) -c gc_runtime_test.c -o $@

clean:
	-$(RM_FILES)
