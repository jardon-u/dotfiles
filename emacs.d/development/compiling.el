(defun my-save-and-recompile ()
  (interactive "")
  (save-buffer 0)
  (recompile))

(global-set-key [f8] 'compile)
(global-set-key [f9] 'my-save-and-recompile)

(provide 'compiling)
(provide 'recompiling)
