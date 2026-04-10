; ModuleID = 'cases/reg_spill_detector.input.ll'
source_filename = "reg_spill_detector.input.ll"

define internal i32 @pressure(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e) {
entry:
  %v1 = add i32 %a, 1
  %v2 = add i32 %b, 2
  %v3 = add i32 %c, 3
  %v4 = add i32 %d, 4
  %v5 = add i32 %e, 5
  %sum1 = add i32 %v1, %v2
  %sum2 = add i32 %v3, %v4
  %sum3 = add i32 %sum1, %sum2
  %sum4 = add i32 %sum3, %v5
  ret i32 %sum4
}

define i32 @main() {
entry:
  %result = call i32 @pressure(i32 1, i32 2, i32 3, i32 4, i32 5)
  ret i32 %result
}

!cool.reg.spill.detector = !{!0}

!0 = !{!"pressure", i32 5, i32 4}
