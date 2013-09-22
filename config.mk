CC	= gcc
CXX	= g++

X11INC = /usr/X11/include
X11LIB = /usr/X11/lib

XINERAMALIBS  = -L${X11LIB} -lXinerama
XINERAMAFLAGS = -DXINERAMA
