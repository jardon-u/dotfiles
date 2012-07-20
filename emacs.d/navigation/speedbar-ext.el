
(require 'speedbar)
(setq speedbar-default-position 'left)
(setq speedbar-frame-parameters '((minibuffer . nil)
                                  (width . 40)
                                  (border-width . 0)
                                  (menu-bar-lines . 0)
                                  (tool-bar-lines . 0)
                                  (unsplittable . t)
                                  (left-fringe . 0)
                                  (left . 0)
                                  ))

(global-set-key  "\M-`" 'speedbar-get-focus)

(provide 'speedbar-ext)