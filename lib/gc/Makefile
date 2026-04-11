CC ?= gcc
AR ?= ar
CFLAGS ?= -std=c11 -Wall -Wextra -O2 -fvisibility=hidden -Wno-unused-parameter -Wno-unused-function

TARGET := libcoolgc.a
TEST_TARGET := libcoolgc_test.a
OBJS := gc.o
TEST_OBJS := gc_test.o

ifeq ($(OS),Windows_NT)
RM_FILES = cmd /c "if exist $(TARGET) del /q /f $(TARGET) & if exist $(TEST_TARGET) del /q /f $(TEST_TARGET) & if exist gc.o del /q /f gc.o & if exist gc_test.o del /q /f gc_test.o" 2>nul
AR_PREP = cmd /c "if exist $@ del /q /f $@" 2>nul
else
CFLAGS += -fPIC
RM_FILES = rm -f $(TARGET) $(TEST_TARGET) $(OBJS) $(TEST_OBJS)
AR_PREP = rm -f $@
endif

.PHONY: all testlib clean

all: $(TARGET)

testlib: $(TEST_TARGET)

$(TARGET): $(OBJS)
	-$(AR_PREP)
	$(AR) rcs $@ $(OBJS)

$(TEST_TARGET): $(TEST_OBJS)
	-$(AR_PREP)
	$(AR) rcs $@ $(TEST_OBJS)

gc.o: gc.c gc.h Makefile
	$(CC) $(CFLAGS) -c gc.c -o $@

gc_test.o: gc.c gc.h Makefile
	$(CC) $(CFLAGS) -DCOOL_GC_NO_MALLOC_WRAPPERS -c gc.c -o $@

clean:
	-$(RM_FILES)
