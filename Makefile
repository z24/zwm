include config.mk

SRC = zwm.c
OBJ = ${SRC:.c=.o}

all: options zwm

options:
	@echo dwm build options:
	@echo "CFLAGS   = ${CFLAGS}"
	@echo "LDFLAGS  = ${LDFLAGS}"
	@echo "CC       = ${CC}"

.c.o:
	@echo CC $<
	@${CC} -c ${CFLAGS} $<

${OBJ}: config.h config.mk

zwm: ${OBJ}
	@echo CC -o $@
	@${CC} -o $@ ${OBJ} ${LDFLAGS}

clean:
	@echo cleaning
	@rm -f zwm ${OBJ} zwm-${VERSION}.tar.gz

dist: clean log
	@echo creating dist tarball
	@mkdir -p zwm-${VERSION}
	@cp -R Makefile config.mk config.h changelog \
		${SRC} zwm-${VERSION}
	@tar czf zwm-${VERSION}.tar.gz zwm-${VERSION}/
	@rm -rf zwm-${VERSION}

log:
	git log --format=format:"[%s] %ci %an <%ae>%n%b" > changelog

.PHONY: all options clean dist log
