; ModuleID = 'cases/local_pinhole.input.ll'
source_filename = "local_pinhole.input.ll"

define internal i32 @fold(i32 %x, i32 %y) {
entry:
  %pinhole.mask = and i32 %x, 16777215
  %wide.left = shl i32 %y, 4
  %wide.right = lshr i32 %wide.left, 2
  %sum = add i32 %pinhole.mask, %wide.right
  ret i32 %sum
}

define i32 @main() {
entry:
  %result = call i32 @fold(i32 255, i32 12)
  ret i32 0
}
