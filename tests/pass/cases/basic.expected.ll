; ModuleID = 'cases/basic.input.ll'
source_filename = "basic.input.ll"

declare void @helper()

define i32 @main() {
entry:
  ret i32 0
}

define void @worker() {
entry:
  ret void
}

!cool.module.summary = !{!0}

!0 = !{!"cool-module-summary", i32 2}
