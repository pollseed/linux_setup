PROGRAM = main
OBJS = main.o util.o
CC = gcc
CFLAGS = -Wall -O2

$(PROGRAM): $(OBJS)
        $(CC) -o $(PROGRAM) $(OBJS)

main.o: main.c
        $(CC) $(CFLAGS) -c $<

util.o: util.c
        $(CC) $(CFLAGS) -c $<

util.o: util.h

.PHONY: clean
clean:
        $(RM) main $(OBJS)
