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

CASE_INPUTS := $(sort $(wildcard cases/*.input.ll))
CASE_OUTPUTS := $(patsubst %.input.ll,%.actual.ll,$(CASE_INPUTS))

.PHONY: build run clean

build:
	@cd $(PASS_DIR) && $(MAKE) all

run: build $(CASE_OUTPUTS)
	@set -e; \
	for actual in $(CASE_OUTPUTS); do \
		expected=$${actual%.actual.ll}.expected.ll; \
		diff -u "$$expected" "$$actual"; \
	done; \
	echo "pass tests passed: $(words $(CASE_OUTPUTS))"

cases/%.actual.ll: cases/%.input.ll $(PASS_PLUGIN)
	$(OPT) -load-pass-plugin $(PASS_PLUGIN) -passes=$(PASS_PIPELINE) -S $< -o $@

clean:
	rm -f cases/*.actual.ll
