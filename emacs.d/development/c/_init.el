(require 'cc-mode)

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

;; public void veryLongMethodNameHereWithArgs(
;;          String arg1,
;;          String arg2,
;;          int arg3)
(defconst my-c-lineup-maximum-indent 60)
(defun my-c-lineup-arglist (langelem)
    (let ((ret (c-lineup-arglist langelem)))
      (if (< (elt ret 0) my-c-lineup-maximum-indent)
          ret
        (save-excursion
          (goto-char (cdr langelem))
          (vector (+ (current-column) 8))))))
(defun my-indent-setup ()
  (setcdr (assoc 'arglist-cont-nonempty c-offsets-alist)
          '(c-lineup-gcc-asm-reg my-c-lineup-arglist)))

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

;; read h header as c++ file
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

; configure semantic for smart completion and code navigation
;; (global-ede-mode 1)
;; (semantic-mode 1)
;; (defun my:add-semantic-to-autocomplete()
;;   (add-to-list 'ac-sources 'ac-source-semantic)
;; )
;; (add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)
;; (define-key c-mode-map "\C-j" 'semantic-ia-fast-jump)
;; (define-key c++-mode-map "\C-j" 'semantic-ia-fast-jump)

(require 'flycheck-google-cpplint)
(require 'f)
;; root project directories must by added to this list
;; (setq semanticdb-project-roots (list "~/dev/pmcv/"))
;; (ede-cpp-root-project "pmcv" :file "~/dev/pmcv/PMCWorkers/exec/pmTurnstile.cpp"
;;                       :include-path (f-glob "~/dev/pmcv/*/inc/"))
;; (global-semantic-idle-scheduler-mode 1)

;; ;; configure flycheck for c++
;; (add-hook 'c++-mode-hook
;;           (lambda () (setq flycheck-clang-standard-library "libc++")))
;; (add-hook 'c++-mode-hook
;;           (lambda () (setq flycheck-clang-language-standard "c++11")))
;; (add-hook 'c++-mode-hook
;;           (lambda ()
;;             (setq flycheck-clang-include-path
;;                   (append
;;                    (list (expand-file-name "/usr/include/c++/4.8/")
;;                          (expand-file-name "/usr/include/x86_64-linux-gnu/c++/4.8/"))
;;                    (f-glob "~/dev/pmcv/*/inc/")
;;                    )
;;                   )))

(add-hook 'c++-mode-hook 'flycheck-mode)

(custom-set-variables
 '(flycheck-c/c++-googlelint-executable
   "~/.emacs.d/development/c/cpplint.py"))

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

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

; initializes auto-complete-c-headers
;; (defun my:ac-c-header-init ()
;;   (require 'auto-complete-c-headers)
;;   (add-to-list 'ac-sources 'ac-source-c-headers)
;;   (add-to-list 'achead:include-directories '"/usr/include/c++/4.8")
;;   (add-to-list 'achead:include-directories '"/usr/include/x86_64-linux-gnu/c++/4.8")
;;   (add-to-list 'achead:include-directories '"/usr/include/c++/4.8/backward")
;;   (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-linux-gnu/4.8/include")
;;   (add-to-list 'achead:include-directories '"/usr/local/include")
;;   (add-to-list 'achead:include-directories '"/usr/include")
;; )
;; (add-hook 'c++-mode-hook 'my:ac-c-header-init)
;; (add-hook 'c-mode-hook 'my:ac-c-header-init)
