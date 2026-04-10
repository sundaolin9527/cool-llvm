source_filename = "smart_loop_unroll.input.ll"

define i32 @main() {
entry:
  br label %loop

loop:
  %i = phi i32 [ 0, %entry ], [ %next, %body ]
  %sum = phi i32 [ 0, %entry ], [ %nextsum, %body ]
  %cmp = icmp slt i32 %i, 4
  br i1 %cmp, label %body, label %exit

body:
  %nextsum = add i32 %sum, %i
  %next = add i32 %i, 1
  br label %loop

exit:
  ret i32 %sum
}
