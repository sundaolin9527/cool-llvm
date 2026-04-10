; ModuleID = 'cases/region_instr_reorder.input.ll'
source_filename = "region_instr_reorder.input.ll"

define internal i32 @reorder(i32 %a, i32 %b, i32 %c) {
entry:
  %x = add i32 %a, 1
  %y = add i32 %x, 2
  %z = add i32 %b, %c
  %r = add i32 %y, %z
  ret i32 %r
}

define i32 @main() {
entry:
  %result = call i32 @reorder(i32 1, i32 2, i32 3)
  ret i32 %result
}
