### Makefile.tpl --- (>>>POINT<<<)

## Author: (>>>AUTHOR<<<)
## Version: $Id: (>>>FILE<<<),v 0.0 (>>>VC_DATE<<<) (>>>LOGIN_NAME<<<) Exp $
## Keywords: (>>>1<<<)
## X-URL: (>>>2<<<)

-include Makefile.rules

PROJ=
SOURCE=
BIN=
FILES= # src

# C++ only
VPATH=src:obj
OBJ=$(SRC:.cc=.o)

all:
	

check:
	

doc:
	

clean:
	rm -f $(BIN)

dist: clean todo AUTHORS svn_check
	rm -rf $(PROJ)
	mkdir $(PROJ)
	cp -r Makefile AUTHORS TODO $(FILES) $(PROJ)
	-find $(PROJ) -name ".svn" -exec rm -rf {} \;
	-find $(PROJ) -name "*~" -exec rm -rf {} \;
	-find $(PROJ) -name "#*" -exec rm -rf {} \;
	tar cjvf $(PROJ).tar.bz2 $(PROJ)
	rm -rf $(PROJ)
	chmod 644 $(PROJ).tar.bz2

svn_check:
	@svn st | grep \? ; [ $$? = "1" ] \
	|| (echo "----------------------------------------------"\
	&& echo "SOME FILES ARE MISSING FROM THE SVN REPOSITORY"\
	&& echo "----------------------------------------------");

todo:
	grep "FIXME" -r . --exclude="Makefile" > TODO

.PHONY: doc check

### (>>>FILE<<<) ends here