source_filename = "global_dead_code_elim.input.ll"

$live_group = comdat any

@decl.global = external global i32
declare i32 @decl.fn()

@root.container = global [2 x ptr] [
  ptr @aggregate.live.global,
  ptr getelementptr inbounds ([1 x i32], ptr @gep.live.storage, i64 0, i64 0)
], align 8
@section.anchor = internal global ptr @section.keep.global, section "llvm.metadata", align 8
@aggregate.live.global = internal global i32 5, align 4
@gep.live.storage = internal global [1 x i32] [i32 9], align 4
@section.keep.global = internal global i32 17, align 4
@live.global = internal global i32 21, align 4
@dbg.keep.global = internal global i32 19, align 4
@dbg.user.keep = internal global i32 23, align 4
@compiler.alias.target = internal global i32 29, align 4
@live.alias = internal alias i32, ptr @compiler.alias.target
@used.global = internal global i32 11, align 4
@comdat.live.a = linkonce_odr global i32 31, comdat($live_group), align 4
@comdat.live.b = linkonce_odr global i32 37, comdat($live_group), align 4

@dead.global = internal global i32 7, align 4
@dead.alias = internal alias i32, ptr @dead.global
@dead.alias.user = internal global ptr @dead.alias, align 8
@dead.only.global = internal global i32 99, align 4

@llvm.used = appending global [2 x ptr] [ptr @used.global, ptr @comdat.live.a], section "llvm.metadata"
@llvm.compiler.used = appending global [1 x ptr] [ptr @live.alias], section "llvm.metadata"

define internal i32 @dead.helper() {
entry:
  %dead.load = load i32, ptr @dead.global, align 4
  ret i32 %dead.load
}

define internal i32 @dead.func() {
entry:
  %dead.value = call i32 @dead.helper()
  %dead.alias.ptr = load ptr, ptr @dead.alias.user, align 8
  %dead.alias.load = load i32, ptr %dead.alias.ptr, align 4
  %dead.sum = add i32 %dead.value, %dead.alias.load
  ret i32 %dead.sum
}

define internal i32 @direct.live.helper() {
entry:
  %live.load = load i32, ptr @live.global, align 4
  ret i32 %live.load
}

define internal i32 @debug.user.live.func() !dbg !20 {
entry:
  %dbg.load = load i32, ptr @dbg.user.keep, align 4, !dbg !24
  ret i32 %dbg.load, !dbg !25
}

define internal i32 @ce.live.callee() {
entry:
  ret i32 13
}

define internal i32 @live.func() {
entry:
  %direct = call i32 @direct.live.helper()
  %debug = call i32 @debug.user.live.func()
  %sum = add i32 %direct, %debug
  ret i32 %sum
}

define i32 @main() {
entry:
  %value = call i32 @live.func()
  %ce = call i32 bitcast (ptr @ce.live.callee to ptr)()
  %ignore = add i32 %value, %ce
  ret i32 0
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "cool-llvm", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !2)
!1 = !DIFile(filename: "global_dead_code_elim.input.ll", directory: "tests/pass/cases")
!2 = !{!3}
!3 = !DIGlobalVariableExpression(var: !4, expr: !DIExpression())
!4 = distinct !DIGlobalVariable(name: "dbg.keep.global", scope: !0, file: !1, line: 1, type: !5, isLocal: true, isDefinition: true)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 5}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{!"cool-llvm test"}
!13 = !DISubroutineType(types: !14)
!14 = !{!5}
!20 = distinct !DISubprogram(name: "debug.user.live.func", scope: !1, file: !1, line: 10, type: !13, scopeLine: 10, spFlags: DISPFlagDefinition, unit: !0)
!24 = !DILocation(line: 11, column: 3, scope: !20)
!25 = !DILocation(line: 12, column: 3, scope: !20)
