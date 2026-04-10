source_filename = "basic.input.ll"

@dead.global = internal global i32 7, align 4
@live.global = internal global i32 5, align 4
@dead.alias = internal alias i32, ptr @dead.global

define internal i32 @dead.func() {
entry:
  ret i32 7
}

define i32 @main() {
entry:
  %value = load i32, ptr @live.global, align 4
  ret i32 0
}
