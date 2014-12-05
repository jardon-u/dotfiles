(require 'color-theme)

(load "~/.emacs.d/display/visual.el")
(load "~/.emacs.d/display/text-display.el")

(require 'color-theme)
(color-theme-initialize)
(color-theme-clarity)

;; zoom in/out
(global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)
(global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-+") 'text-scale-increase)

(require 'flymake)
(load "~/.emacs.d/display/flymake-cursor.el")
(set-face-background 'flymake-errline "red4")
(set-face-background 'flymake-warnline "dark slate blue")

(load "~/.emacs.d/display/highlight-indentation.el")
