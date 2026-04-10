source_filename = "smart_loop_unroll.input.ll"

define i32 @main() {
entry:
  br label %preheader

preheader:
  br label %loop

loop:
  %i = phi i32 [ 0, %preheader ], [ %next, %body ]
  %sum = phi i32 [ 1, %preheader ], [ %nextsum, %body ]
  %cmp = icmp slt i32 %i, 8
  br i1 %cmp, label %body, label %exit

body:
  %scaled = mul i32 %sum, 2
  %nextsum = add i32 %scaled, %i
  %next = add i32 %i, 1
  br label %loop

exit:
  ret i32 0
}
