(setq default-tab-width 2)
(require 'pig-mode)

(setq auto-mode-alist (cons '("\\.pig$" . pig-mode) auto-mode-alist))