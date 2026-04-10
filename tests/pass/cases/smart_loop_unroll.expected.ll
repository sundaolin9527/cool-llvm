; ModuleID = 'cases/smart_loop_unroll.input.ll'
source_filename = "smart_loop_unroll.input.ll"

define i32 @main() {
entry:
  br label %preheader

preheader:                                        ; preds = %entry
  br label %loop

loop:                                             ; preds = %body, %preheader
  %i = phi i32 [ 0, %preheader ], [ %next, %body ]
  %sum = phi i32 [ 1, %preheader ], [ %nextsum, %body ]
  %cmp = icmp slt i32 %i, 8
  br i1 %cmp, label %body, label %exit

body:                                             ; preds = %loop
  %scaled = mul i32 %sum, 2
  %nextsum = add i32 %scaled, %i
  %next = add i32 %i, 1
  br label %loop, !llvm.loop !0

exit:                                             ; preds = %loop
  ret i32 0
}

!0 = distinct !{!0, !1, !2}
!1 = !{!"llvm.loop.unroll.count", i32 4}
!2 = !{!"cool.smart.unroll"}
