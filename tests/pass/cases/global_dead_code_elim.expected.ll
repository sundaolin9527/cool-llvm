; ModuleID = 'cases/global_dead_code_elim.input.ll'
source_filename = "global_dead_code_elim.input.ll"

$live_group = comdat any

@decl.global = external global i32
@root.container = global [2 x ptr] [ptr @aggregate.live.global, ptr @gep.live.storage], align 8
@section.anchor = internal global ptr @section.keep.global, section "llvm.metadata", align 8
@aggregate.live.global = internal global i32 5, align 4
@gep.live.storage = internal global [1 x i32] [i32 9], align 4
@section.keep.global = internal global i32 17, align 4
@live.global = internal global i32 21, align 4
@dbg.keep.global = internal global i32 19, align 4
@dbg.user.keep = internal global i32 23, align 4
@compiler.alias.target = internal global i32 29, align 4
@used.global = internal global i32 11, align 4
@comdat.live.a = linkonce_odr global i32 31, comdat($live_group), align 4
@comdat.live.b = linkonce_odr global i32 37, comdat($live_group), align 4
@llvm.used = appending global [2 x ptr] [ptr @used.global, ptr @comdat.live.a], section "llvm.metadata"
@llvm.compiler.used = appending global [1 x ptr] [ptr @live.alias], section "llvm.metadata"

@live.alias = internal alias i32, ptr @compiler.alias.target

declare i32 @decl.fn()

define internal i32 @direct.live.helper() {
entry:
  %live.load = load i32, ptr @live.global, align 4
  ret i32 %live.load
}

define internal i32 @debug.user.live.func() !dbg !9 {
entry:
  %dbg.load = load i32, ptr @dbg.user.keep, align 4, !dbg !12
  ret i32 %dbg.load, !dbg !13
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
  %ce = call i32 @ce.live.callee()
  %ignore = add i32 %value, %ce
  ret i32 0
}

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "cool-llvm", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !2)
!1 = !DIFile(filename: "global_dead_code_elim.input.ll", directory: "tests/pass/cases")
!2 = !{!3}
!3 = !DIGlobalVariableExpression(var: !4, expr: !DIExpression())
!4 = distinct !DIGlobalVariable(name: "dbg.keep.global", scope: !0, file: !1, line: 1, type: !5, isLocal: true, isDefinition: true)
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{i32 7, !"Dwarf Version", i32 5}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{!"cool-llvm test"}
!9 = distinct !DISubprogram(name: "debug.user.live.func", scope: !1, file: !1, line: 10, type: !10, scopeLine: 10, spFlags: DISPFlagDefinition, unit: !0)
!10 = !DISubroutineType(types: !11)
!11 = !{!5}
!12 = !DILocation(line: 11, column: 3, scope: !9)
!13 = !DILocation(line: 12, column: 3, scope: !9)
