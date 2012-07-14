(require 'text-display)
(require 'visual)

(require 'color-theme)
(color-theme-initialize)
(color-theme-clarity)

;; zoom in/out
(global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)
(global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
(global-set-key (kbd "C-+") 'text-scale-increase)

(require 'flymake)
(require 'flymake-cursor)
(set-face-background 'flymake-errline "red4")
(set-face-background 'flymake-warnline "dark slate blue")

(require 'highlight-indentation)