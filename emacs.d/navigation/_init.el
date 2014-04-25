(load "~/.emacs.d/navigation/buffer-rotate.el")
(load "~/.emacs.d/navigation/place-marker.el")

(global-set-key [(control tab)] 'other-window)
(global-set-key [(pause)] 'kill-this-buffer)

(require 'ido)
(ido-mode t)
(icomplete-mode t)

(global-set-key [(control right)] 'forward-sexp)
(global-set-key [(control left)]  'backward-sexp)

(global-set-key [(meta right)] 'forward-word)
(global-set-key [(meta left)]  'backward-word)

(global-set-key [f5]  'delete-other-windows)

(fset 'yes-or-no-p 'y-or-n-p)
