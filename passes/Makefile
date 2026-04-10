LLVM_VERSION ?= 16
LLVM_CONFIG ?= llvm-config-$(LLVM_VERSION)

ifeq ($(shell which $(LLVM_CONFIG) 2>/dev/null),)
    $(error LLVM $(LLVM_VERSION) not found. Please install llvm-$(LLVM_VERSION) and llvm-$(LLVM_VERSION)-dev)
endif

CXX ?= clang++
CXXFLAGS += -fPIC -Wall -Wextra -Wpedantic $(shell $(LLVM_CONFIG) --cxxflags) -std=c++17
LDFLAGS += -shared
LDLIBS += $(shell $(LLVM_CONFIG) --ldflags --libs core passes support) $(shell $(LLVM_CONFIG) --system-libs)

SRCS := $(sort $(wildcard *.cpp))
PASS_NAMES := $(basename $(SRCS))
TARGETS := $(addprefix lib,$(addsuffix .so,$(PASS_NAMES)))
OBJS := $(SRCS:.cpp=.o)

.PHONY: all clean

all: $(TARGETS)

lib%.so: %.o
	$(CXX) $(LDFLAGS) $< -o $@ $(LDLIBS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(TARGETS)
