(load "~/.emacs.d/development/c/_init")
(load "~/.emacs.d/development/d/_init")
;(load "~/.emacs.d/development/matlab/_init")
(load "~/.emacs.d/development/pig/_init")
(load "~/.emacs.d/development/python/_init")

; Compilation
(defun my-save-and-recompile ()
  (interactive "")
  (save-buffer 0)
  (recompile))
(global-set-key [f8] 'compile)
(global-set-key [f9] 'my-save-and-recompile)

(provide 'compiling)
(provide 'recompiling)

; Do not use tab for indentation
(setq-default indent-tabs-mode nil)
(setq default-tab-width 2)
(setq c-basic-offset 2)

;;(setq show-paren-style 'expression)
(setq show-paren-style 'paren)
(setq show-paren-delay 0)
(show-paren-mode)

; Auto use flyspell with .tex
(add-hook 'latex-mode-hook 'flyspell-mode)
(add-hook 'latex-mode-hook 'flyspell-buffer)

;;; activate ecb
(require 'ecb)
(require 'ecb-autoloads)

;;; gdb
(setq gdb-many-windows t)
(setq gdb-use-separate-io-buffer t)

(defadvice gdb (before ecb-deactivate activate)
"if ecb activated, deactivate it."
(when (and (boundp 'ecb-minor-mode) ecb-minor-mode)
(ecb-deactivate)))

(add-hook 'gdb-mode-hook '(lambda () (gud-tooltip-mode 1)))

(defadvice gud-kill-buffer-hook (after gud-tooltip-mode activate)
"After gdb killed, disable gud-tooltip-mode."
(gud-tooltip-mode -1))
