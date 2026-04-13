; ModuleID = 'cases/global_dead_code_elim.input.ll'
source_filename = "global_dead_code_elim.input.ll"

@live.global = internal global i32 5, align 4
@used.global = internal global i32 11, align 4
@llvm.used = appending global [1 x ptr] [ptr @used.global], section "llvm.metadata"

define internal i32 @live.func() {
entry:
  %live.load = load i32, ptr @live.global, align 4
  %live.sum = add i32 %live.load, 1
  ret i32 %live.sum
}

define i32 @main() {
entry:
  %value = call i32 @live.func()
  ret i32 0
}
