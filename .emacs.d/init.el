(setq CONFIGURATION-PATH (expand-file-name "~/.emacs.d"))
(setq load-path (cons CONFIGURATION-PATH load-path))

(require 'packages-manager)

(packages-manager-load-packages
 CONFIGURATION-PATH
 (list
  "display"
  "editing"
  "navigation"
  "development"
  ))



