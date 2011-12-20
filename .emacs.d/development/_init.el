(require 'compiling)

(packages-manager-load-packages (concat CONFIGURATION-PATH "/development")
                                (list
                                 "c"
                                 "d"
                                 "pig"
                                 "lisp"
                                 "matlab"
                                 "python"
                                 "go"
                                 ))


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
