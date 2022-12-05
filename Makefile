STACK = stack

.PHONY: all test clean

all:
	stack build test

test:   clean
	$(STACK) test