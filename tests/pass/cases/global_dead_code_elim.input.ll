source_filename = "global_dead_code_elim.input.ll"

@dead.global = internal global i32 7, align 4
@live.global = internal global i32 5, align 4
@used.global = internal global i32 11, align 4
@dead.alias = internal alias i32, ptr @dead.global
@llvm.used = appending global [1 x ptr] [ptr @used.global], section "llvm.metadata"

define internal i32 @dead.helper() {
entry:
  %dead.load = load i32, ptr @dead.global, align 4
  ret i32 %dead.load
}

define internal i32 @dead.func() {
entry:
  %dead.value = call i32 @dead.helper()
  ret i32 %dead.value
}

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
