; ModuleID = 'cases/interprocedural_constant_prop.input.ll'
source_filename = "interprocedural_constant_prop.input.ll"

define internal i32 @mix(i32 %x, i32 %y) {
entry:
  %sum = add i32 7, %y
  %scaled = mul i32 %sum, 7
  ret i32 %scaled
}

define i32 @main() {
entry:
  %left = call i32 @mix(i32 7, i32 1)
  %right = call i32 @mix(i32 7, i32 2)
  %result = add i32 %left, %right
  ret i32 0
}
