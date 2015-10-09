PROGRAM = main
OBJS = main.o
CC = gcc
CFLAGS = -Wall -O2

$(PROGRAM): $(OBJS) util.o
        $(CC) -o $(PROGRAM) $(OBJS) util.o

main.o: main.c
        $(CC) $(CFLAGS) -c $<

util.o: util.c
        $(CC) $(CFLAGS) -c $<

util.o: util.h

.PHONY: clean
clean:
        $(RM) main $(OBJS) util.o
