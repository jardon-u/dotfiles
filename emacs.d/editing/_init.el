(require 'template)
(template-initialize)

(require 'pc-select)
(pc-selection-mode)

(require 'dos-unix-conversion)

;; ========== Place Backup Files in Specific Directory ==========

;; Enable backup files.
(setq make-backup-files t)

;; Enable versioning with default values (keep five last versions, I think!)
(setq version-control t)

;; Save all backup file in this directory.
(setq backup-directory-alist (quote ((".*" . "~/.emacs.d/backup"))))


;; provide line and column position
(column-number-mode t)
(line-number-mode t)

;; insert text while the mark is active causes the selected
;; text to be deleted first
(delete-selection-mode 1)

;; mouse specific
(mouse-avoidance-mode 'jump)
(setq mouse-yank-at-point t)

;; indent after 80 columns
(set-default 'fill-column 80)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'latex-mode-hook 'turn-on-auto-fill)
(add-hook 'changelog-mode-hook 'turn-on-auto-fill)

(global-hi-lock-mode 1)

;;(set-default 'truncate-lines t)

(global-set-key [(control meta b)] 'toggle-truncate-lines)
(global-set-key [(control z)] 'undo)
(global-set-key [(meta g)] 'goto-line)
(global-set-key [f12] 'delete-trailing-whitespace)

(require 'cc-mode)
;;Setting Tab to indent region if anything is selected
(defun tab-indents-region () (local-set-key [(tab)] 'fledermaus-maybe-tab))
(add-hook 'c-mode-common-hook   'tab-indents-region)
;;fledermaus came up with this
(defun fledermaus-maybe-tab ()
  (interactive)
  (if (and transient-mark-mode mark-active)
      (indent-region (region-beginning) (region-end) nil)
    (c-indent-command)))

(add-hook 'autoconf-mode-hook   'flyspell-prog-mode)
(add-hook 'autotest-mode-hook   'flyspell-prog-mode)
(add-hook 'c++-mode-hook        'flyspell-prog-mode)
(add-hook 'c-mode-hook          'flyspell-prog-mode)
(add-hook 'cperl-mode-hook      'flyspell-prog-mode)
(add-hook 'emacs-lisp-mode-hook 'flyspell-prog-mode)
(add-hook 'makefile-mode-hook   'flyspell-prog-mode)
(add-hook 'nxml-mode-hook       'flyspell-prog-mode)
(add-hook 'python-mode-hook     'flyspell-prog-mode)
(add-hook 'sh-mode-hook         'flyspell-prog-mode)

(require 'smart-tab)
(global-smart-tab-mode 1)

(cua-mode)
;; toggle rectangle mark / regular mark using C-Space
(global-set-key (kbd "C-SPC")
                '(lambda(&optional arg) (interactive "P")
                   (if (or (not mark-active) arg)
                       (cua-set-mark arg)
                     (cua-toggle-rectangle-mark))))