# Generated automatically from Makefile.in by configure.
VERSION=4.0
CC?=gcc
INSTALL=install
#prefix=/usr
CFLAGS=-g -O2 -DHAVE_CONFIG_H -Wall -I. -DVERSION=\"$(VERSION)\" -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -DPREFIX=\"$(prefix)\" 
LIBS= -lcrypt
mandir=${prefix}/man
sbindir=${exec_prefix}/sbin
DESTDIR=
DIRPAX=
PAX=

# pling added 04/27/2009
#include ../config.mk
#include ../config.in

VERSION=1.6.6
CFLAGS += -O2 -DHAVE_CONFIG_H -DDEBUG -D__OG2263__ -Wall -I. -DVERSION=\"$(VERSION)\" -D_LARGEFILE_SOURCE -DQUICK_FIX_ISSUES -ULEAN
all: bftpd
LIBS= -lcrypt

HEADERS=bftpdutmp.h commands.h commands_admin.h cwd.h dirlist.h list.h login.h logging.h main.h mystring.h options.h targzip.h mypaths.h
OBJS=bftpdutmp.o commands.o commands_admin.o cwd.o dirlist.o list.o login.o logging.o main.o mystring.o options.o
SRCS=bftpdutmp.c commands.c commands_admin.c cwd.c dirlist.c list.c login.c logging.c main.c mystring.c options.c

CFLAGS  += -I. -I$(TOP)/shared -I$(SRCBASE)/include -Wall
LDFLAGS=-Wl,-allow-shlib-undefined
LDFLAGS += -L$(ROUTERDIR)/nvram -L$(INSTALLDIR)/nvram/usr/lib -lnvram

bftpd: $(OBJS)
	./mksources $(DIRPAX)
	$(CC) $(LDFLAGS) $(OBJS) $(LIBS) -o bftpd

install: all
	mkdir -p $(INSTALLDIR)/sbin
#	$(INSTALL) -g 0 -m 700 -o 0 bftpd $(INSTALLDIR)/sbin
	$(INSTALL) -m 755 bftpd $(INSTALLDIR)/sbin
#	mkdir -p $(DESTDIR)/$(mandir)/man8
#	$(INSTALL) -g 0 -m 644 -o 0 bftpd.8 $(DESTDIR)/$(mandir)/man8
	mkdir -p $(INSTALLDIR)/etc
	[ -f $(INSTALLDIR)/etc/bftpd.conf ] || \
		$(INSTALL) bftpd.conf $(INSTALLDIR)/etc
	mkdir -p $(INSTALLDIR)/etc/log
	touch $(INSTALLDIR)/etc/log/bftpd.log
	chmod 644 $(INSTALLDIR)/etc/log/bftpd.log
	mkdir -p $(INSTALLDIR)/etc/run/bftpd
	chmod 755 $(INSTALLDIR)/etc/run/bftpd
	$(STRIP) $(INSTALLDIR)/sbin/bftpd
clean:
	-rm -f bftpd $(OBJS) mksources.finished config.cache
	rm -f $(INSTALLDIR)/bin/bftpd
	#rm -f $(INSTALLDIR)/etc/bftpd.conf

