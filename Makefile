.PHONY: all clean cgen cgen-llvm

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
	@echo "  help       - Show this help (default)"

.DEFAULT_GOAL := help
DEBUG ?= 0
export DEBUG