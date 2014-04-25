(load "~/.emacs.d/development/pig/pig-mode")

(setq auto-mode-alist (cons '("\\.pig$" . pig-mode) auto-mode-alist))
