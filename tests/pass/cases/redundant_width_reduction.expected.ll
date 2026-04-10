; ModuleID = 'cases/redundant_width_reduction.input.ll'
source_filename = "redundant_width_reduction.input.ll"

define internal i32 @narrow(i8 %a, i8 %b) {
entry:
  %sum32.narrow = add i8 %a, %b
  %wide = zext i8 %sum32.narrow to i32
  ret i32 %wide
}

define i32 @main() {
entry:
  %result = call i32 @narrow(i8 3, i8 4)
  ret i32 0
}
