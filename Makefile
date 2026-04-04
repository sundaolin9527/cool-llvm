.PHONY: all clean cgen cgen-llvm build-unit-tests test-unit

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

build-unit-tests:
	@echo "Building C++ unit test runner..."
	@cd tests/unit && $(MAKE) build

test-unit:
	@echo "Running IR golden tests..."
	@cd tests/unit && $(MAKE) run

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
	@echo "  build-unit-tests - Build the C++ IR unit test runner"
	@echo "  dotest     - Run tests with original cgen"
	@echo "  test-unit  - Run C++ IR golden-file unit tests"
	@echo "  help       - Show this help (default)"

.DEFAULT_GOAL := help
DEBUG ?= 0
export DEBUG
