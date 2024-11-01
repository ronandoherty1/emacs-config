;;; c-eval-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "c-eval" "c-eval.el" (0 0 0 0))
;;; Generated autoloads from c-eval.el

(autoload 'c-eval-scratch "c-eval" "\
Create or select the *c-eval-scratch* buffer." t nil)

(autoload 'c-eval-region "c-eval" "\
Compile and run text between START and END as C program.

\(fn START END)" t nil)

(autoload 'c-eval-buffer "c-eval" "\
Compile and run accessible portion of buffer as C program." t nil)

(autoload 'c-eval-expression "c-eval" "\
Compile and run C program that outputs the TYPE result of EXPRESSION.

\(fn TYPE EXPRESSION)" t nil)

(autoload 'c-eval-sizeof "c-eval" "\
Compile and run C program that outputs sizeof(TYPE).

\(fn TYPE)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "c-eval" '("c-eval-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; c-eval-autoloads.el ends here
