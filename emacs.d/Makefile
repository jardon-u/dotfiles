EMACS = $(shell which emacs)

ELFILES := $(shell find . -type d \( -path "./cedet-bzr" -o -path "./elpa" -o -path "./.cask" \) -prune -o -name "*.el")
ELCFILES = $(ELFILES:.el=.elc)

all: $(ELCFILES)
	printf *-*-* Done *-*-*

## FIXME : Make emacs compiling everything at once
%.elc: %.el
	@printf "$<:\n"
	$(EMACS) --batch --eval '(setq load-path (cons "." load-path))' \
		-f batch-byte-compile $<

clean:
	rm -f $(ELCFILES)
