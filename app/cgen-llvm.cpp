#include "cgen-llvm-ir.h"
#include "cgen.h"

void emit_llvm_ir(Program program) {
    CodeGenerator codegen;
    codegen.emit_llvm_ir(program);
}