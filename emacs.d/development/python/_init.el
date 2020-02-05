
;; (defun my/python-mode-hook ()
;;   (add-to-list 'company-backends 'company-jedi))
;; (add-hook 'python-mode-hook 'my/python-mode-hook)
;; (add-hook 'python-mode-hook 'eldoc-mode)

;; (eval-after-load "company"
;;  '(progn
;;    (add-to-list 'company-backends 'company-anaconda)))


(add-hook 'python-mode-hook 'flycheck-mode)
(add-hook 'python-mode-hook 'highlight-indentation-mode)

(eval-after-load "company"
 '(add-to-list 'company-backends 'company-anaconda))
(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)
(add-hook 'python-mode-hook 'anaconda-mode-complete)

(defvar anaconda-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-j") 'anaconda-mode-find-definitions)
    (define-key map (kbd "C-d") 'anaconda-mode-find-assignments)
    (define-key map (kbd "C-f") 'anaconda-mode-find-references)
    map)
  "Keymap for `anaconda-mode'.")

;; delete trailing whitespaces on save
(add-hook 'python-mode-hook
          (lambda () (add-to-list 'write-file-functions 'delete-trailing-whitespace)))
