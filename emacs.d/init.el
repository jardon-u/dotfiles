(setq CONFIGURATION-PATH (expand-file-name "~/.emacs.d"))
(setq load-path (cons CONFIGURATION-PATH load-path))

;; Development

(require 'package)
(setq package-archives
      '(("melpa" . "http://melpa.milkbox.net/packages/")
        ("ELPA" . "http://tromey.com/elpa/")
        ("gnu" . "http://elpa.gnu.org/packages/")
        ))
(package-initialize)

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(load "~/.emacs.d/development/_init")
(load "~/.emacs.d/display/_init")
(load "~/.emacs.d/editing/_init")
(load "~/.emacs.d/navigation/_init")

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
