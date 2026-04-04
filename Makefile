.PHONY: all clean cgen cgen-llvm test-units unit-test dotest test-llvm output help

UNIT_TEST_FILTER := $(strip $(filter-out unit-test,$(MAKECMDGOALS)))

ifneq ($(UNIT_TEST_FILTER),)
$(foreach goal,$(UNIT_TEST_FILTER),$(eval .PHONY: $(goal))$(eval $(goal): ; @:))
endif

all:
	@echo "Building COOL compiler..."
	@cd app && $(MAKE) all

cgen:
	@echo "Building cgen..."
	@cd app && $(MAKE) cgen

cgen-llvm:
	@echo "Building cgen-llvm..."
	@cd app && $(MAKE) cgen-llvm

clean:
	@echo "Cleaning..."
	@cd app && $(MAKE) clean
	@cd tests/unit && $(MAKE) clean

test-units: cgen
	@echo "Running all IR golden tests..."
	@cd tests/unit && $(MAKE) run

unit-test: cgen
ifeq ($(UNIT_TEST_FILTER),)
	@echo "Usage: make unit-test <case-file-or-filter>"
	@exit 1
else
	@echo "Running IR golden tests matching: $(UNIT_TEST_FILTER)"
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
	@echo "  clean      - Clean build artifacts"
	@echo "  dotest     - Run tests with original cgen"
	@echo "  test-units - Build dependencies and run all IR golden-file unit tests"
	@echo "  unit-test <case> - Run IR golden-file unit tests matching one case/filter"
	@echo "  help       - Show this help (default)"

.DEFAULT_GOAL := help
DEBUG ?= 0
export DEBUG
