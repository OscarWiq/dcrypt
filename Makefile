PREFIX = /usr/local

CC = cc
CFLAGS 	= -std=c99 -pedantic -Wall -Werror

SRC = dcrypt.c
OBJ = $(SRC:.c=.o)

dcrypt: $(OBJ)
	$(CC) -o $@ $(OBJ)

$(OBJ):

.c.o:
	$(CC) -c $(CFLAGS) $<

install: dcrypt
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f dcrypt $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/dcrypt

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/dcrypt

clean:
	rm -f dcrypt $(OBJ)

.PHONY: install uninstall clean