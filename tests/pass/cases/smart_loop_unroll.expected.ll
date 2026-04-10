; ModuleID = 'cases/smart_loop_unroll.input.ll'
source_filename = "smart_loop_unroll.input.ll"

define i32 @main() {
entry:
  br label %loop

loop:                                             ; preds = %body, %entry
  %i = phi i32 [ 0, %entry ], [ %next, %body ]
  %sum = phi i32 [ 0, %entry ], [ %nextsum, %body ]
  %cmp = icmp slt i32 %i, 4
  br i1 %cmp, label %body, label %exit

body:                                             ; preds = %loop
  %nextsum = add i32 %sum, %i
  %next = add i32 %i, 1
  br label %loop, !llvm.loop !0

exit:                                             ; preds = %loop
  ret i32 0
}

!0 = distinct !{!0, !1, !2}
!1 = !{!"llvm.loop.unroll.count", i32 4}
!2 = !{!"cool.smart.unroll"}
