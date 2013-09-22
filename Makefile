VERSION = 0.1

include ./config.mk

INCS = -I. -I/usr/include -I${X11INC} -I/usr/include/freetype2/
LIBS = -L/usr/lib -lc -L${X11LIB} -lX11 -lXft ${XINERAMALIBS}

CFLAGS  = -DVERSION=\"${VERSION}\" ${XINERAMAFLAGS} ${INCS}
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
