(add-hook 'python-mode-hook 'flycheck-mode)
(add-hook 'python-mode-hook 'highlight-indentation-mode)

(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))
(add-hook 'python-mode-hook 'my/python-mode-hook)

;; (eval-after-load "company"
;;  '(progn
;;    (add-to-list 'company-backends 'company-anaconda)))

;(add-hook 'python-mode-hook 'anaconda-mode)
;(add-hook 'python-mode-hook 'eldoc-mode)
