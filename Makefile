all: sed

sed: compile.c main.c misc.c process.c
	$(CC) -o $@ $^ $(shell pkg-config --cflags --libs libbsd-overlay) -D_GNU_SOURCE $(CFLAGS)

install: all
	install -d $(DESTDIR)/usr/bin
	install sed $(DESTDIR)/usr/bin
	install -d $(DESTDIR)/usr/share/man/man1
	install -m644 sed.1 $(DESTDIR)/usr/share/man/man1
