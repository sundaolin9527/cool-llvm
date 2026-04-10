source_filename = "local_pinhole.input.ll"

define internal i32 @fold(i32 %x, i32 %y) {
entry:
  %shiftl = shl i32 %x, 8
  %shiftr = lshr i32 %shiftl, 8
  %wide.left = shl i32 %y, 4
  %wide.right = lshr i32 %wide.left, 2
  %sum = add i32 %shiftr, %wide.right
  ret i32 %sum
}

define i32 @main() {
entry:
  %result = call i32 @fold(i32 255, i32 12)
  ret i32 0
}
