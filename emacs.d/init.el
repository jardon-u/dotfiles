;(setq CONFIGURATION-PATH (expand-file-name "~/.emacs.d"))
;(setq load-path (cons CONFIGURATION-PATH load-path))

;; Development

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/") t)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/") t)
  )

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(load "~/.emacs.d/development/_init")
(load "~/.emacs.d/display/_init")
(load "~/.emacs.d/editing/_init")
(load "~/.emacs.d/navigation/_init")

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
