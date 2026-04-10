source_filename = "redundant_width_reduction.input.ll"

define internal i32 @narrow(i8 %a, i8 %b, i8 %c) {
entry:
  %a32 = zext i8 %a to i32
  %b32 = zext i8 %b to i32
  %sum32 = add i32 %a32, %b32
  %sum8 = trunc i32 %sum32 to i8
  %sumWide = zext i8 %sum8 to i32
  %c32 = sext i8 %c to i32
  %mix32 = add i32 %sumWide, %c32
  ret i32 %mix32
}

define i32 @main() {
entry:
  %result = call i32 @narrow(i8 3, i8 4, i8 5)
  ret i32 0
}
