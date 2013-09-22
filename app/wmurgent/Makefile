include ../../config.mk

all: wmurgent

install: all
	@mkdir -p ${DESTDIR}${PREFIX}/bin
	@cp -f wmurgent ${DESTDIR}${PREFIX}/bin
	@chmod 755 ${DESTDIR}${PREFIX}/bin/wmurgent

uninstall:
	@rm -f ${DESTDIR}${PREFIX}/bin/wmurgent

clean:
	rm -f wmurgent

wmurgent:wmurgent.c
	${CC} -L${X11LIB} $< -o $@ -lX11
