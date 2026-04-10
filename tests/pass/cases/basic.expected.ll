; ModuleID = 'cases/basic.input.ll'
source_filename = "basic.input.ll"

@live.global = internal global i32 5, align 4

define i32 @main() {
entry:
  %value = load i32, ptr @live.global, align 4
  ret i32 0
}
