VERSION = 1.1.6.0

X11INC = /usr/X11/include
X11LIB = /usr/X11/lib

XINERAMALIBS  = -L${X11LIB} -lXinerama
XINERAMAFLAGS = -DXINERAMA

INCS = -I. -I/usr/include -I${X11INC} -I/usr/include/freetype2/
LIBS = -L/usr/lib -lc -L${X11LIB} -lX11 -lXft ${XINERAMALIBS}

# flags
CPPFLAGS = -DVERSION=\"${VERSION}\" ${XINERAMAFLAGS}
#CFLAGS = -g -std=c99 -pedantic -Wall -O0 ${INCS} ${CPPFLAGS}
CFLAGS = -std=c99 -pedantic -Wall -Os ${INCS} ${CPPFLAGS}
#LDFLAGS = -g ${LIBS}
LDFLAGS = -s ${LIBS}

CC = gcc
