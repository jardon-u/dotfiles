(setq CONFIGURATION-PATH (expand-file-name "~/.emacs.d"))
(setq load-path (cons CONFIGURATION-PATH load-path))

;; Development

(load "~/.emacs.d/development/_init")
(load "~/.emacs.d/display/_init")
(load "~/.emacs.d/editing/_init")
(load "~/.emacs.d/navigation/_init")

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )
