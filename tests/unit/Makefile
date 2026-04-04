CXX ?= g++
CXXFLAGS ?= -std=c++17 -O2 -Wall -Wextra -pedantic

TARGET := ir_golden_test_runner
SRCS := ir_golden_test_main.cpp ir_test_framework.cpp
OBJS := $(SRCS:.cpp=.o)
TEST_FILTER ?=

.PHONY: build run clean

build: $(TARGET)

run: $(TARGET)
	./$(TARGET) $(if $(strip $(TEST_FILTER)),--filter "$(TEST_FILTER)",)

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) $(OBJS) -o $(TARGET)

%.o: %.cpp ir_test_framework.h
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -f $(TARGET) $(OBJS)
