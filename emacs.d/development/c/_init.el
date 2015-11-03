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

(setq c-basic-offset 2)

(require 'cc-mode)

(defun c-reformat-buffer()
  (interactive)
  (save-buffer)
  (setq sh-indent-command
        (concat
         "indent -st -bad"
         " --blank-lines-after-procedures "
         "-bli0 -i4 -l79 -ncs -npcs -nut -npsl -fca "
         "-lc79 -fc1 -cli4 -bap -sob -ci4 -nlp "
         buffer-file-name
         ))
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

;; This is a hack for Placemeter code
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(defun add-custom-keyw()
  "adds a few special keywords for c and c++ modes"
  (font-lock-add-keywords nil
     '(("\\<\\(nullptr\\)" . 'font-lock-keyword-face )
       ("\\<\\(override\\)" . 'font-lock-keyword-face )
       )
     )
  )

(add-hook 'c++-mode-hook 'add-custom-keyw)

(define-key c-mode-map [(f7)] 'c-reformat-buffer)
(define-key c++-mode-map [(f7)] 'c-reformat-buffer)

(define-key c-mode-map "\C-j" 'semantic-ia-fast-jump)
(define-key c++-mode-map "\C-j" 'semantic-ia-fast-jump)

;; root project directories must by added to this list
(setq semanticdb-project-roots (list "~/dev/pmcv/"))

;;(global-ede-mode 1)

;; configure flycheck for c++
(require 'f)
(add-hook 'c++-mode-hook
         (lambda () (setq flycheck-clang-standard-library "libc++")))
(add-hook 'c++-mode-hook
          (lambda () (setq flycheck-clang-language-standard "c++11")))
(add-hook 'c++-mode-hook
          (lambda ()
            (setq flycheck-clang-include-path
                  (append
                   (list (expand-file-name "/usr/include/c++/4.8/")
                         (expand-file-name "/usr/include/x86_64-linux-gnu/c++/4.8/"))
                   (f-glob "~/dev/pmcv/*/inc/")
                   )
                  )))
(add-hook 'c++-mode-hook 'flycheck-mode)

(custom-set-variables
 '(flycheck-c/c++-googlelint-executable
   "~/.emacs.d/development/c/cpplint.py"))

(load "~/.emacs.d/development/c/flycheck-google-cpplint.el")
(flycheck-add-next-checker 'c/c++-clang
                           'c/c++-googlelint)

(custom-set-variables
 '(flycheck-googlelint-verbose "0")
 '(flycheck-googlelint-filter "-,+whitespace,-whitespace/braces,-whitespace/newline,-whitespace/comments,+build/include_what_you_use,+build/include_order,+readability/todo")
 '(flycheck-googlelint-linelength "120")
 '(flycheck-googlelint-root "~/dev/pmcv"))

;; Only needed on Windows
;(when (eq system-type 'windows-nt)
;  (setq w32-pipe-read-delay 0))
