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
