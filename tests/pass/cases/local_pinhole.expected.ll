; ModuleID = 'cases/local_pinhole.input.ll'
source_filename = "local_pinhole.input.ll"

define internal i32 @fold(i32 %x) {
entry:
  %pinhole.mask = and i32 %x, 16777215
  ret i32 %pinhole.mask
}

define i32 @main() {
entry:
  %result = call i32 @fold(i32 255)
  ret i32 0
}
