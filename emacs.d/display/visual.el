(tool-bar-mode -1)
(setq inhibit-splash-screen t)

;; Prevent the annoying beep on errors
(setq visible-bell t)

(blink-cursor-mode -1)

;; remove scrollbar
(set-scroll-bar-mode nil)

;; Postpend directory to file with identical name
(require 'uniquify)
(setq
 uniquify-buffer-name-style 'post-forward)

(provide 'visual)