; ModuleID = 'cases/interprocedural_constant_prop.input.ll'
source_filename = "interprocedural_constant_prop.input.ll"

define internal i32 @add_one(i32 %x) {
entry:
  %sum = add i32 41, 1
  ret i32 %sum
}

define i32 @main() {
entry:
  %result = call i32 @add_one(i32 41)
  ret i32 %result
}
