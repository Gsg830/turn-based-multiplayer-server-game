CFLAGS= -DPORT=\$(PORT) -g -Wall -Werror
PORT= 52688

all: battle

battle: battle.c
	gcc $(CFLAGS) battle.c -o battle

clean:
	rm -f *.o battle