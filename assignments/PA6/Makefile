# ==================== LLVM 16.0.6 配置 ====================
LLVM_VERSION = 16
LLVM_CONFIG = llvm-config-${LLVM_VERSION}

ifeq ($(shell which $(LLVM_CONFIG) 2>/dev/null),)
    $(error LLVM $(LLVM_VERSION) not found. Please install llvm-$(LLVM_VERSION) and llvm-$(LLVM_VERSION)-dev)
endif

LLVM_CXXFLAGS = $(shell $(LLVM_CONFIG) --cxxflags) -std=c++17
LLVM_LDFLAGS = $(shell $(LLVM_CONFIG) --ldflags)
LLVM_LIBS = $(shell $(LLVM_CONFIG) --libs all)
LLVM_SYSTEM_LIBS = $(shell $(LLVM_CONFIG) --system-libs)

# =========================================================
ASSN = 6
CLASS = cs143
CLASSDIR = ../..
AR = gar
ARCHIVE_NEW = -cr
RANLIB = gar -qs

SRC = cgen.cc cgen.h cgen_supp.cc cool-tree.h cool-tree.handcode.h emit.h example.cl README
CSRC = cgen-phase.cc utilities.cc stringtab.cc dumptype.cc tree.cc cool-tree.cc ast-lex.cc ast-parse.cc handle_flags.cc 
TSRC = mycoolc
CGEN =
HGEN = 
LIBS = lexer parser semant
CFIL = cgen.cc cgen_supp.cc cgen-llvm.cc ${CSRC} ${CGEN}
LSRC = Makefile
OBJS = ${CFIL:.cc=.o}
OUTPUT = good.output bad.output

CPPINCLUDE = -I. -I${CLASSDIR}/include/PA${ASSN} -I${CLASSDIR}/src/PA${ASSN}

FFLAGS = -d8 -ocool-lex.cc
BFLAGS = -d -v -y -b cool --debug -p cool_yy

CC = g++
CFLAGS = -g -Wall -Wno-unused -Wno-write-strings -Wno-deprecated \
         ${CPPINCLUDE} ${LLVM_CXXFLAGS} -DDEBUG

LIB = -lfl ${LLVM_LDFLAGS} ${LLVM_LIBS} ${LLVM_SYSTEM_LIBS}

FLEX = flex ${FFLAGS}
BISON = bison ${BFLAGS}
DEPEND = ${CC} -MM ${CPPINCLUDE}

# ==================== 目标 ====================
.PHONY: all llvm clean

all: cgen cgen-llvm

cgen: ${OBJS} parser semant
	${CC} ${CFLAGS} ${OBJS} ${LIB} -o cgen

cgen-llvm: ${OBJS} parser semant cgen-llvm.o
	${CC} ${CFLAGS} ${OBJS} cgen-llvm.o ${LIB} -o cgen-llvm

cgen-llvm.o: cgen-llvm.cc
	${CC} ${CFLAGS} -c cgen-llvm.cc -o cgen-llvm.o

source: ${SRC} ${TSRC} ${LIBS} lsource

lsource: ${LSRC}

${OUTPUT}: cgen
	@rm -f ${OUTPUT}
	./mycoolc example.cl >example.output 2>&1

compile: cgen change-prot

change-prot:
	@-chmod 660 ${SRC} ${OUTPUT}

dotest: cgen example.cl
	@echo "\nRunning code generator on example.cl\n"
	-./mycoolc example.cl

${LIBS}:
	${CLASSDIR}/etc/link-object ${ASSN} $@

${TSRC} ${CSRC}:
	-ln -s ${CLASSDIR}/src/PA${ASSN}/$@ $@

${HSRC}:
	-ln -s ${CLASSDIR}/include/PA${ASSN}/$@ $@

.cc.o:
	${CC} ${CFLAGS} -c $<

clean:
	-rm -f ${OUTPUT} *.s *.ll core ${OBJS} cgen cgen-llvm cgen-llvm.o parser semant lexer *~ *.a *.o

clean-compile:
	@-rm -f core ${OBJS} ${LSRC}

%.d: %.cc ${SRC}
	${SHELL} -ec '${DEPEND} $< | sed '\''s/\($*\.o\)[ :]*/\1 $@ : /g'\'' > $@'

-include ${CFIL:.cc=.d}