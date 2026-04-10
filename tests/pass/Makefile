CXX ?= g++
CXXFLAGS ?= -std=c++17 -O2 -Wall -Wextra -pedantic

LLVM_VERSION ?= 16
LLVM_CONFIG ?= llvm-config-$(LLVM_VERSION)

ifeq ($(shell which $(LLVM_CONFIG) 2>/dev/null),)
    $(error LLVM $(LLVM_VERSION) not found. Please install llvm-$(LLVM_VERSION) and llvm-$(LLVM_VERSION)-dev)
endif

ROOT_DIR := ../..
PASS_DIR := $(ROOT_DIR)/passes
OPT := $(shell $(LLVM_CONFIG) --bindir)/opt
PASS_PLUGIN ?= {case_plugin}
PASS_PIPELINE ?= {case_pipeline}
TARGET := pass_test_runner
OBJS := golden_test_main.o golden_test_framework.o
PREPARE_CMD := $(OPT) -load-pass-plugin "$(PASS_PLUGIN)" -passes="$(PASS_PIPELINE)" -S {input_rel} -o {actual_artifact_rel}
LINK_CMD := clang++ {actual_artifact_rel} -o {executable_rel}
RUN_CMD := {executable_rel}

ifeq ($(OS),Windows_NT)
RM_FILES = cmd /c del /q /f $(TARGET) $(TARGET).exe $(OBJS) cases\\*.actual.ll 2>nul
RM_DIRS = cmd /c rmdir /s /q .artifacts 2>nul
else
RM_FILES = rm -f $(TARGET) $(OBJS) cases/*.actual.ll
RM_DIRS = rm -rf .artifacts
endif

.PHONY: build run clean

build:
	@cd $(PASS_DIR) && $(MAKE) all
	@$(MAKE) $(TARGET)

run: build
	./$(TARGET) --repo-root ../.. --suite-dir . --cases-dir cases --artifacts-dir .artifacts --input-ext .input.ll --expected-artifact-ext .expected.ll --actual-artifact-ext .actual.ll --expected-output-ext .expected.txt --prepare-output file --prepare-cmd "$(PREPARE_CMD)" --link-cmd "$(LINK_CMD)" --run-cmd "$(RUN_CMD)"

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) $(OBJS) -o $(TARGET)

golden_test_main.o: ../golden_test_main.cpp ../golden_test_framework.h
	$(CXX) $(CXXFLAGS) -c ../golden_test_main.cpp -o $@

golden_test_framework.o: ../golden_test_framework.cpp ../golden_test_framework.h
	$(CXX) $(CXXFLAGS) -c ../golden_test_framework.cpp -o $@

clean:
	-$(RM_FILES)
	-$(RM_DIRS)
