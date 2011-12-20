EMACS = $(shell which emacs)

ELFILES := $(shell find . -name "*.el")
ELCFILES = $(ELFILES:.el=.elc)

all: $(ELCFILES)
	printf *-*-* Done *-*-*

## FIXME : Make emacs compiling everything at once
%.elc: %.el
	printf \e[31m\e[1m $<: \e[m \n
	$(EMACS) --batch --eval '(setq load-path (cons "." load-path))' \
		-f batch-byte-compile $<

clean:
	rm -f $(ELCFILES)
