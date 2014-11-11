;(setq ipython-command "/usr/bin/ipython")
;(require 'ipython)

;; python-mode settings
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist(cons '("python" . python-mode)
                             interpreter-mode-alist))
;; path to the python interpreter, e.g.: ~rw/python27/bin/python2.7
(setq py-python-command "python")
(autoload 'python "python" "Python editing mode." t)

;; pymacs settings
(setq pymacs-python-command py-python-command)
(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")

;(require 'pycomplete)
(add-hook 'python-mode-hook 'flycheck-mode)
(setq flycheck-flake8-maximum-line-length 120)

;(add-hook 'python-mode-hook 'highlight-indentation-current-column-mode)
(add-hook 'python-mode-hook 'highlight-indentation-mode)
;(set-face-background 'highlight-indentation-face "#e3e3d3")
;(set-face-background 'highlight-indentation-current-column-face "#c3b3b3")
