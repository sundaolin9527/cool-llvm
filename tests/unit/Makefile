CXX ?= g++
CXXFLAGS ?= -std=c++17 -O2 -Wall -Wextra -pedantic

TARGET := unit_test_runner
OBJS := unit_test_suite_main.o golden_test_framework.o
TEST_FILTER ?=

ifeq ($(OS),Windows_NT)
RM_FILES = cmd /c del /q /f $(TARGET) $(TARGET).exe $(OBJS) 2>nul
RM_DIRS = cmd /c rmdir /s /q .artifacts 2>nul
else
RM_FILES = rm -f $(TARGET) $(OBJS)
RM_DIRS = rm -rf .artifacts
endif

.PHONY: build run clean

build: $(TARGET)

run: $(TARGET)
	./$(TARGET) $(if $(strip $(TEST_FILTER)),--filter "$(TEST_FILTER)",)

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) $(OBJS) -o $(TARGET)

unit_test_suite_main.o: ../unit_test_suite_main.cpp ../golden_test_framework.h
	$(CXX) $(CXXFLAGS) -c ../unit_test_suite_main.cpp -o $@

golden_test_framework.o: ../golden_test_framework.cpp ../golden_test_framework.h
	$(CXX) $(CXXFLAGS) -c ../golden_test_framework.cpp -o $@

clean:
	-$(RM_FILES)
	-$(RM_DIRS)
