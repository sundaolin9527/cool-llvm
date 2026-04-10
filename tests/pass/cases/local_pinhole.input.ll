source_filename = "local_pinhole.input.ll"

define internal i32 @fold(i32 %x) {
entry:
  %shiftl = shl i32 %x, 8
  %shiftr = lshr i32 %shiftl, 8
  ret i32 %shiftr
}

define i32 @main() {
entry:
  %result = call i32 @fold(i32 255)
  ret i32 %result
}
