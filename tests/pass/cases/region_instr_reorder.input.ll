source_filename = "region_instr_reorder.input.ll"

define internal i32 @reorder(i32 %a, i32 %b, i32 %c) {
entry:
  %z = add i32 %b, %c
  %x = add i32 %a, 1
  %y = add i32 %x, 2
  %t = mul i32 %y, 3
  %r = add i32 %t, %z
  ret i32 %r
}

define i32 @main() {
entry:
  %result = call i32 @reorder(i32 1, i32 2, i32 3)
  ret i32 0
}
