(load "~/.emacs.d/development/c/_init")
;(load "~/.emacs.d/development/d/_init")
;(load "~/.emacs.d/development/matlab/_init")
;(load "~/.emacs.d/development/pig/_init")
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
;(setq default-tab-width 4)

;;(setq show-paren-style 'expression)
(setq show-paren-style 'paren)
(setq show-paren-delay 0)
(show-paren-mode)

; Auto use flyspell with .tex
(add-hook 'latex-mode-hook 'flyspell-mode)
(add-hook 'latex-mode-hook 'flyspell-buffer)

;;; activate ecb
;(require 'ecb)
;(require 'ecb-autoloads)

;; display function doc inline
;;(eldoc-mode)

;; ; start auto-complete with default configuration
;(ac-config-default)

;; ; yasnippet
;; (require 'yasnippet)
;; (yas-global-mode 1)

;; highlights all occurences in the buffer of the word under the point
(require 'idle-highlight-mode)
(add-hook 'prog-mode-hook (lambda () (idle-highlight-mode t)))

;; activate company mode for completion
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
; completion suggestion order depends on most often used completion
(add-hook 'after-init-hook 'company-statistics-mode)
(setq company-idle-delay 0)

; set face for company mode
(require 'color)
(let ((bg (face-attribute 'default :background)))
  (custom-set-faces
   '(company-tooltip ((t (:background "#030B1C"))))
   '(company-scrollbar-bg ((t (:background "DimGrey"))))
   '(company-scrollbar-fg ((t (:background "cyan1"))))
   '(company-tooltip-selection ((t (:background "#05436C"))))
   '(company-tooltip-common-selection ((t (:foreground "salmon"
 :inherit company-tooltip-selection))))
   '(company-tooltip-common ((t (:foreground "salmon" :inherit company-tooltip))))
   '(company-tooltip-annotation ((t (:foreground "LightSkyBlue" :inherit company-tooltip))))
   '(company-preview ((t (:foreground "white" :inherit company-tooltip))))
   '(company-preview-common ((t (:foreground "salmon" :background "transparent"))))
   '(company-tooltip-search ((t (:inherit company-tooltip-common))))))

;; add jump to file in sh-mode
(eval-after-load 'sh-mode
  '(define-key sh-mode-map "C-j" 'find-file-at-point))

(add-hook 'json-mode-hook
          (lambda ()
            (make-local-variable 'js-indent-level)
            (setq js-indent-level 2)))
