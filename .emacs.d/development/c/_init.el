;;if(0)          becomes        if (0)
;;  {                           {
;;     ;                           ;
;;  }                           }
(c-set-offset 'substatement-open 0)
;;
;; better
;; (setq c-mode-hook
;;        '(lambda ()
;;        (c-set-style "K&R")))


(require 'cc-mode)

(setq c-basic-offset 2)

(defun c-reformat-buffer()
  (interactive)
  (save-buffer)
  (setq sh-indent-command (concat
                           "indent -st -bad"
                           " --blank-lines-after-procedures "
                           "-bli0 -i4 -l79 -ncs -npcs -nut -npsl -fca "
                           "-lc79 -fc1 -cli4 -bap -sob -ci4 -nlp "
                           buffer-file-name
                           )
        )
  (mark-whole-buffer)
  (universal-argument)
  (shell-command-on-region
   (point-min)
   (point-max)
   sh-indent-command
   (buffer-name)
   )
  (save-buffer)
  )

(define-key c-mode-map [(f7)] 'c-reformat-buffer)
(define-key c++-mode-map [(f7)] 'c-reformat-buffer)

(define-key c-mode-map "\C-j" 'semantic-ia-fast-jump)
(define-key c++-mode-map "\C-j" 'semantic-ia-fast-jump)