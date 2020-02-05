(load "~/.emacs.d/display/visual.el")
(load "~/.emacs.d/display/text-display.el")

(load-theme 'clarity t t)
(enable-theme 'clarity)

;; zoom in/out
(global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)
(global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-+") 'text-scale-increase)


(custom-set-variables              ; Sets show-trailing-whitespace as expected
 '(show-trailing-whitespace t))
