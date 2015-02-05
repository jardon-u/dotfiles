(setq CONFIGURATION-PATH (expand-file-name "~/.emacs.d"))
(setq load-path (cons CONFIGURATION-PATH load-path))

;; Development

(require 'package)
(package-initialize)
(setq package-archives
      '(("melpa" . "http://melpa.milkbox.net/packages/")
        ("ELPA" . "http://tromey.com/elpa/")
        ("gnu" . "http://elpa.gnu.org/packages/")
        ))

(load "~/.emacs.d/development/_init")
(load "~/.emacs.d/display/_init")
(load "~/.emacs.d/editing/_init")
(load "~/.emacs.d/navigation/_init")
