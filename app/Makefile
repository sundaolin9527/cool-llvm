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
DEBUG ?= 0
ASSN = include
CLASS = cs143
CLASSDIR = ../
AR = gar
ARCHIVE_NEW = -cr
RANLIB = gar -qs

SRC = cgen.cpp cgen.h cgen_supp.cpp cool-tree.h cool-tree.handcode.h emit.h example.cl README
CSRC = cgen-phase.cpp utilities.cpp stringtab.cpp dumptype.cpp tree.cpp cool-tree.cpp ast-lex.cpp ast-parse.cpp handle_flags.cpp cgen-context.cpp cgen-llvm-ir.cpp symbol-table.cpp runtimeAPI.cpp 
TSRC = mycoolc
CGEN =
HGEN = 
LIBS = lexer parser semant
CFIL = cgen.cpp cgen_supp.cpp cgen-llvm.cpp ${CSRC} ${CGEN}
LSRC = Makefile
OBJS = ${CFIL:.cpp=.o}
OUTPUT = good.output bad.output

CPPINCLUDE = -I. -I${CLASSDIR}/include/ -I${CLASSDIR}/src/

FFLAGS = -d8 -ocool-lex.cpp
BFLAGS = -d -v -y -b cool --debug -p cool_yy

CC = g++
CFLAGS = -g -Wall -Wno-unused -Wno-write-strings -Wno-deprecated \
         ${CPPINCLUDE} ${LLVM_CXXFLAGS}

ifeq ($(DEBUG),1)
    CFLAGS += -DDEBUG
endif

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

cgen-llvm.o: cgen-llvm.cpp
	${CC} ${CFLAGS} -c cgen-llvm.cpp -o cgen-llvm.o

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
	-ln -s ${CLASSDIR}/src/$@ $@

${HSRC}:
	-ln -s ${CLASSDIR}/include/$@ $@

.cpp.o:
	${CC} ${CFLAGS} -c $<

clean:
	-rm -f ${OUTPUT} *.s *.ll core ${OBJS} cgen cgen-llvm cgen-llvm.o parser semant lexer *~ *.a *.o

clean-compile:
	@-rm -f core ${OBJS} ${LSRC}

%.d: %.cpp ${SRC}
	${SHELL} -ec '${DEPEND} $< | sed '\''s/\($*\.o\)[ :]*/\1 $@ : /g'\'' > $@'

-include ${CFIL:.cpp=.d}