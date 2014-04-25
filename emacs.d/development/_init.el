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
