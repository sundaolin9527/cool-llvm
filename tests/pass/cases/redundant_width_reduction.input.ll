source_filename = "redundant_width_reduction.input.ll"

define internal i32 @narrow(i8 %a, i8 %b) {
entry:
  %a32 = zext i8 %a to i32
  %b32 = zext i8 %b to i32
  %sum32 = add i32 %a32, %b32
  %sum8 = trunc i32 %sum32 to i8
  %wide = zext i8 %sum8 to i32
  ret i32 %wide
}

define i32 @main() {
entry:
  %result = call i32 @narrow(i8 3, i8 4)
  ret i32 0
}
