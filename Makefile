VERSION = 0.1

CC	= gcc
CXX	= g++

X11INC = /usr/X11/include
X11LIB = /usr/X11/lib64

XINERAMALIBS  = -L${X11LIB} -lXinerama
XINERAMAFLAGS = -DXINERAMA

INCS = -I. -I/usr/include -I${X11INC}
LIBS = -L/usr/lib64 -L${X11LIB} -lX11 -lXft ${XINERAMALIBS}

CFLAGS  = -std=c99 -pedantic -Wall -Wno-deprecated-declarations -Os -DVERSION=\"${VERSION}\" ${XINERAMAFLAGS} ${INCS}
LDFLAGS = -s ${LIBS}

all: zwm

clean:
	@rm -f zwm

zwm: zwm.c
	${CC} ${CFLAGS} ${LDFLAGS} -o $@ $^ ${LIBS}

log:
	@git log --format=format:"%ci %an <%ae>%n%s%n%n%b" > changelog

dist: clean log
	@mkdir -p zwm-${VERSION}
	@cp -R config.mk Makefile config.h zwm.c changelog \
		zwm-${VERSION}
	@tar czf zwm-${VERSION}.tar.gz zwm-${VERSION}/
	@rm -rf zwm-${VERSION}
