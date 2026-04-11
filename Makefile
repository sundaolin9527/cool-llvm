.PHONY: all compiler-all llvm-pass clean cgen cgen-llvm gc-lib runtime-lib test-gc test-units unit-test test-pass dotest test-llvm output help

UNIT_TEST_FILTER := $(strip $(filter-out unit-test,$(MAKECMDGOALS)))

ifneq ($(filter unit-test,$(MAKECMDGOALS)),)
ifneq ($(UNIT_TEST_FILTER),)
$(foreach goal,$(UNIT_TEST_FILTER),$(eval .PHONY: $(goal))$(eval $(goal): ; @:))
endif
endif

all: compiler-all llvm-pass

compiler-all:
	@echo "Building COOL compiler..."
	@cd app && $(MAKE) all

cgen:
	@echo "Building cgen..."
	@cd app && $(MAKE) cgen

cgen-llvm:
	@echo "Building cgen-llvm..."
	@cd app && $(MAKE) cgen-llvm

gc-lib:
	@echo "Building GC library..."
	@cd lib/gc && $(MAKE) all

runtime-lib: gc-lib
	@echo "Building runtime library..."
	@cd lib/runtime && $(MAKE) all

test-gc: gc-lib
	@echo "Running GC tests..."
	@cd tests/gc && $(MAKE) run

llvm-pass:
	@echo "Building LLVM pass plugin..."
	@cd passes && $(MAKE) all

clean:
	@echo "Cleaning..."
	@cd app && $(MAKE) clean
	@cd lib/gc && $(MAKE) clean
	@cd lib/runtime && $(MAKE) clean
	@cd passes && $(MAKE) clean
	@cd tests/gc && $(MAKE) clean
	@cd tests/unit && $(MAKE) clean
	@cd tests/pass && $(MAKE) clean

test-units: cgen-llvm runtime-lib
	@echo "Running all unit tests..."
	@cd tests/unit && $(MAKE) run

test-pass: llvm-pass
	@echo "Running LLVM pass tests..."
	@cd tests/pass && $(MAKE) run

unit-test: cgen-llvm runtime-lib
ifeq ($(UNIT_TEST_FILTER),)
	@echo "Usage: make unit-test <case-file-or-filter>"
	@exit 1
else
	@echo "Running unit tests matching: $(UNIT_TEST_FILTER)"
	@cd tests/unit && $(MAKE) run TEST_FILTER="$(UNIT_TEST_FILTER)"
endif

dotest: cgen
	@echo "Testing..."
	@cd app && $(MAKE) dotest

test-llvm: cgen-llvm
	@echo "Testing LLVM version..."
	@cd app && ./cgen-llvm example.cl

output:
	@cd app && $(MAKE) ${OUTPUT}

help:
	@echo "COOL Compiler Build System"
	@echo ""
	@echo "Available targets:"
	@echo "  all        - Build the compiler and LLVM pass plugin"
	@echo "  llvm-pass  - Build the standalone LLVM pass plugin"
	@echo "  clean      - Clean build artifacts"
	@echo "  dotest     - Run tests and print IR"
	@echo "  test-gc    - Build GC library and run GC-only tests"
	@echo "  test-units - Build dependencies and run all executable-output unit tests"
	@echo "  test-pass  - Build the LLVM pass plugin and run pass text-diff tests"
	@echo "  unit-test <case> - Run executable-output unit tests matching one case/filter"
	@echo "  help       - Show this help (default)"

.DEFAULT_GOAL := help
DEBUG ?= 0
export DEBUG
