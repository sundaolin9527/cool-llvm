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
PASS_PLUGIN ?= $(PASS_DIR)/libCoolModuleSummaryPass.so
PASS_PIPELINE ?= cool-module-summary
TARGET := pass_test_runner
OBJS := golden_test_main.o golden_test_framework.o
PREPARE_CMD := $(OPT) -load-pass-plugin $(PASS_PLUGIN) -passes=$(PASS_PIPELINE) -S {input_rel} -o {actual_artifact_rel}
LINK_CMD := clang++ {actual_artifact_rel} -o {executable_rel}
RUN_CMD := {executable_rel}

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
	rm -f $(TARGET) $(OBJS) cases/*.actual.ll
