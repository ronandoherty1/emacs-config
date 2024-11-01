;;Set up package.el to work with MELPA
(require 'package)
(setq package-enable-at-startup nil)
(setq package-native-compile t)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			  ("org" . "https://orgmode.org/elpa/")
			  ("elpa" . "https://elpa.gnu.org/packages/")))
(setq package-quickstart t)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

;;Getting rid of some ugly UI elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;Adding numbered lines in all buffers
(global-display-line-numbers-mode 1)

;;Setting scrolling
(setq scroll-step            1
      scroll-conservatively  10000
      scroll-margin 3)

;;Enable Evil
(require 'evil)
(evil-mode 1)
;;Setting keybindings with evil
(evil-set-leader 'normal (kbd "SPC"))
(define-key evil-normal-state-map (kbd "<leader>b") 'switch-to-buffer)
(define-key evil-normal-state-map (kbd "<leader>e") 'eval-buffer)
(define-key evil-normal-state-map (kbd "<leader>q") 'delete-window)
(define-key evil-normal-state-map (kbd "<leader>t") 'kill-buffer)
(define-key evil-normal-state-map (kbd "<leader>d") 'dired)
(define-key evil-normal-state-map (kbd "<leader>j") 'scroll-up-command)
(define-key evil-normal-state-map (kbd "<leader>k") 'scroll-down-command)
(define-key evil-normal-state-map (kbd "<leader>a") 'find-file)
(define-key evil-normal-state-map (kbd "<leader>;") 'split-window-right)
(define-key evil-normal-state-map (kbd "<leader>'") 'split-window-below)
(define-key evil-normal-state-map (kbd "<leader>s") 'eshell)
(define-key evil-normal-state-map (kbd "<leader>]") 'other-window)

;;setting undo system in evil
(use-package undo-tree
  :ensure t
  :after evil
  :diminish
  :config
  (evil-set-undo-system 'undo-tree)
  (global-undo-tree-mode 1))

;;Dracula theme
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;;(load-theme 'dracula t)

(use-package solo-jazz-theme
  :ensure t
  :config
  (load-theme 'solo-jazz t))

;;Setting up a dashboard
(require 'dashboard)
(dashboard-setup-startup-hook)

;;centre content
(setq dashboard-center-content t)

;; Set the title
(setq dashboard-banner-logo-title "Welcome to Emacs RD")

;; Set the banner
(setq dashboard-startup-banner 'logo)

;;Get rid of quote
(setq dashboard-set-footer nil)


;;Adding icons to widgets and items
(use-package all-the-icons
  :if (display-graphic-p))

;;Setting widgets
(setq dashboard-items '((recents  . 10)
                        (agenda . 10)))

(require 'all-the-icons)
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(ispell-dictionary nil)
 '(minimap-mode nil)
 '(minimap-window-location 'right)
 '(org-agenda-files
   '("/home/ronan/Documents/exchange/todo.org" "/home/ronan/Documents/exchange/CERN_questions.org" "/home/ronan/Documents/exchange/all.org" "/home/ronan/Documents/exchange/calendar.org" "/home/ronan/Documents/exchange/itinerary.org" "/home/ronan/Documents/exchange/rooms.org" "/home/ronan/Documents/exchange/travel_and_reentry.org" "/home/ronan/Documents/exchange/vaccines.org"))
 '(org-directory "~/Documents/exchange")
 '(package-selected-packages
   '(magit org-anki yasnippet flycheck solo-jazz-theme org-bullets pdf-tools undo-tree spell-fu jedi smartparens org-fragtog auctex wc-mode anki-editor c-eval minimap elpy dracula-theme rainbow-delimiters emms sage-shell-mode use-package maxima dashboard evil))
 '(sage-shell:check-ipython-version-on-startup nil)
 '(sage-shell:set-ipython-version-on-startup nil)
 '(sage-shell:use-prompt-toolkit nil)
 '(sage-shell:use-simple-prompt t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-document-title ((t (:inherit default :weight bold :foreground "gray80" :family "Sans Serif" :height 2.5 :underline nil))))
 '(org-level-1 ((t (:inherit default :weight bold :foreground "gray80" :family "Sans Serif" :height 2.25))))
 '(org-level-2 ((t (:inherit default :weight bold :foreground "gray80" :family "Sans Serif" :height 2.0))))
 '(org-level-3 ((t (:inherit default :weight bold :foreground "gray80" :family "Sans Serif" :height 1.75))))
 '(org-level-4 ((t (:inherit default :weight bold :foreground "gray80" :family "Sans Serif" :height 1.5))))
 '(org-level-5 ((t (:inherit default :weight bold :foreground "gray80" :family "Sans Serif"))))
 '(org-level-6 ((t (:inherit default :weight bold :foreground "gray80" :family "Sans Serif"))))
 '(org-level-7 ((t (:inherit default :weight bold :foreground "gray80" :family "Sans Serif"))))
 '(org-level-8 ((t (:inherit default :weight bold :foreground "gray80" :family "Sans Serif")))))

;;Setting load path to org mode
(add-to-list 'load-path "~/src/org-mode/lisp")


;;Setting org mode keybindings globally
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

;;Turning on Font Lock in Org buffers
;;(add-hook 'org-mode-hook #'turn-on-font-lock)

;;Add org agenda file
(setq org-agenda-files '("~/Documents/todo.org"))
(setq dashboard-filter-agenda-entry 'dashboard-no-filter-agenda)


;;Add agenda
;;(add-to-list 'dashboard-items '(agenda) t)

;;fragtog
(add-hook 'org-mode-hook 'org-fragtog-mode)

(defun my/org-fragtog-preview-all ()
  "Preview all LaTeX fragments in the current Org buffer."
  (when (derived-mode-p 'org-mode)
    (org-latex-preview)))

(add-hook 'org-mode-hook 'my/org-fragtog-preview-all)

;;Setting .org files to show overview on startup
;;(setq org-startup-folded t)

;;Turning off emphasis markers eg *, /, _
(setq org-hide-emphasis-markers t)

;;Hopefully setting visual-line-mode
(global-visual-line-mode t)
;;(add-hook 'org-mode-hook 'visual-line-mode)
;;Setting different size fonts for headlines
 (let* ((variable-tuple
          (cond ((x-list-fonts "ETBembo")         '(:font "ETBembo"))
                ((x-list-fonts "Source Sans Pro") '(:font "Source Sans Pro"))
                ((x-list-fonts "Lucida Grande")   '(:font "Lucida Grande"))
                ((x-list-fonts "Verdana")         '(:font "Verdana"))
                ((x-family-fonts "Sans Serif")    '(:family "Sans Serif"))
                (nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
         (base-font-color     (face-foreground 'default nil 'default))
         (headline           `(:inherit default :weight bold :foreground ,base-font-color)))

    (custom-theme-set-faces
     'user
     `(org-level-8 ((t (,@headline ,@variable-tuple))))
     `(org-level-7 ((t (,@headline ,@variable-tuple))))
     `(org-level-6 ((t (,@headline ,@variable-tuple))))
     `(org-level-5 ((t (,@headline ,@variable-tuple))))
     `(org-level-4 ((t (,@headline ,@variable-tuple :height 1.1))))
     `(org-level-3 ((t (,@headline ,@variable-tuple :height 1.25))))
     `(org-level-2 ((t (,@headline ,@variable-tuple :height 1.5))))
     `(org-level-1 ((t (,@headline ,@variable-tuple :height 1.75))))
     `(org-document-title ((t (,@headline ,@variable-tuple :height 2.0 :underline nil))))))
;;Setting org key-bindings
(add-hook 'org-mode-hook
	  (lambda()
	    (define-key evil-normal-state-map (kbd "TAB") 'org-cycle)
	    (define-key evil-normal-state-map (kbd "<leader>TAB") 'org-cycle)
	    (define-key evil-normal-state-map (kbd "<leader>l") 'org-insert-link)
	    (define-key evil-normal-state-map (kbd "<leader>u") 'org-todo)
	    (define-key evil-normal-state-map (kbd "<leader>i") 'org-latex-preview)
	    (define-key evil-normal-state-map (kbd"<leader>r") 'org-redisplay-inline-images)))

;;org mode hook for visual-line mode
(add-hook 'org-fill-mode-hook (lambda() (auto-fill-mode)))

;;Allowing python source code in org mode
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t) (R . t)))
(defun ck/org-confirm-babel-evaluate (lang body)
  (not (or (string= lang "latex") (string= lang "python") (string= lang "R"))))
(setq org-confirm-babel-evaluate 'ck/org-confirm-babel-evaluate)
(setq org-babel-R-command "/bin/R --slave --no-save")


;;Set the python command for org
(setq org-babel-python-command "/usr/bin/python3")

;;Saving macro for creating python code block
(fset 'make-python-code-block
   (kmacro-lambda-form [escape ?i ?# ?+ ?b ?e ?i backspace ?g ?i ?n ?_ ?s ?r ?c ?  ?p ?y ?t ?h ?o ?n return return ?# ?+ ?e ?n ?d ?_ ?s ?r ?c escape ?k] 0 "%d"))

;;(add-hook 'org-mode-hook (lambda()
;;			   ((define-key evil-normal-state-map (kbd "<leader>p") 'make-python-code-block))))

;;Inline org images
(setq org-startup-with-inline-images t)

;;Latex font size
(setq org-format-latex-options (plist-put org-format-latex-options :scale 1.5))

;;Setting up emms players    
(require 'emms-setup)
(emms-all)
(emms-default-players)

;;Rainbow delimiters on in programming mode
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)


;;Configuring elpy
(elpy-enable)
(add-hook 'python-mode-hook (lambda()
			      (define-key evil-normal-state-local-map (kbd "<leader>c") 'elpy-shell-send-region-or-buffer)
			      (define-key evil-normal-state-local-map (kbd "<leader>f") 'elpy-goto-definition)))

;;Hopefully fix scrolling error
(add-to-list 'process-coding-system-alist '("python" . (utf-8 . utf-8)))
(setq elpy-rpc-python-command "python3")
(setenv "PYTHONIOENCODING" "utf-8")
(add-to-list 'process-coding-system-alist '("python" . (utf-8 . utf-8)))
(add-to-list 'process-coding-system-alist '("elpy" . (utf-8 . utf-8)))
(add-to-list 'process-coding-system-alist '("flake8" . (utf-8 . utf-8)))

;;Enabling projectile for elpy project management
(add-to-list 'load-path "~/.emacs.d/projectile")
(require 'projectile)

;;Enabling neotree
(add-to-list 'load-path "~/.emacs.d/neotree/neotree")
(require 'neotree)
(define-key evil-normal-state-map (kbd "<leader>n") 'neotree-toggle)

;(evil-set-initial-state 'neotree-mode 'emacs)
			
;;Changing keybindings in to work in evil normal mode
(add-hook 'neotree-mode-hook
;	   (lambda ()
;	     (message "Entering NeoTree mode, disabling Evil mode.")
;	     (local-set-key (kbd "j") 'neotree-next-line)
;	     (local-set-key (kbd "k") 'neotree-previous-line)
;	     (local-set-key (kbd "SPC") 'neotree-quick-look)
;	     (local-set-key (kbd "TAB") 'neotree-collapse-all)
;	     (local-set-key (kbd "l") 'neotree-change-root)
;	     (local-set-key (kbd "q") 'neotree-hide)))
	  (lambda ()
;	    (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
	    (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-collapse-all)
	    (define-key evil-normal-state-local-map (kbd "RET")     (neotree-make-executor
								     :file-fn 'neo-open-file
								     :dir-fn  'neo-open-dir))
            (define-key evil-normal-state-local-map (kbd "<leader>l") 'neotree-quick-look)
            (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
            (define-key evil-normal-state-local-map (kbd "<leader>u") 'neotree-refresh)
            (define-key evil-normal-state-local-map (kbd "j") 'neotree-next-line)
            (define-key evil-normal-state-local-map (kbd "k") 'neotree-previous-line)
	    (define-key evil-normal-state-local-map (kbd "l") 'neotree-change-root)
            (define-key evil-normal-state-local-map (kbd "A") 'neotree-stretch-toggle)
;	    (define-key evil-normal-state-local-map (kbd "U") 'neotree-directory-up)
            (define-key evil-normal-state-local-map (kbd "H") 'neotree-hidden-file-toggle)))

;;Setting keybinding for minimap
(define-key evil-normal-state-map (kbd "<leader>m") 'minimap-mode)

;;Loading path to mu4e
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")

;;c-eval
;;(define-key evil-normal-state-map (kbd "<leader>C") 'c-eval-buffer)


;;auctex
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(setq TeX-view-program-selection '((output-pdf "Zathura")))
;;(define-key evil-normal-state-map (kbd "<leader>p") 'TeX-command-run-all)

;;Fold all envs of a certain type

(defun latex-fold-foo ()
  (interactive)
  (let ((env (read-from-minibuffer "Environment: ")))
    (save-excursion
      (goto-char (point-min))
      (while (search-forward (format "begin{%s}" env) nil t)
        (TeX-fold-env)))))

(defun latex-unfold-foo ()
  "Unfold all environments of a given name in the current LaTeX buffer."
  (interactive)
  (let ((env (read-from-minibuffer "Environment to unfold: ")))
    (save-excursion
      (goto-char (point-min))
      (while (search-forward (format "begin{%s}" env) nil t)
        (TeX-fold-clearout-item)))))

(defun my-latex-mode-setup ()
  "Custom setup for LaTeX mode."
  (TeX-fold-mode 1)
  (define-key evil-normal-state-local-map (kbd "<leader>f") 'latex-fold-foo)
  (define-key evil-normal-state-local-map (kbd "<leader>u") 'latex-unfold-foo)
  (define-key evil-normal-state-local-map (kbd "<leader>c") 'TeX-command-master)
  (define-key evil-normal-state-local-map (kbd "mu") 'TeX-fold-env))

(add-hook 'LaTeX-mode-hook 'my-latex-mode-setup)

(add-hook 'TeX-after-compilation-finished-functions
	  'TeX-revert-document-buffer)

;;smart brackets in python
(add-hook 'python-mode-hook #'smartparens-mode)

;;flyspell
(dolist (hook '(text-mode-hook))
      (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (hook '(latex-mode-hook))
      (add-hook hook (lambda () (flyspell-mode 1))))

;;Add r-mode
(add-to-list 'load-path "~/.emacs.d/r-mode")
(require 'r-mode)

;;Add org bullets
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;;Add flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

;;Adding yasnippets
(setq yas-snippet-dirs '("~/.emacs.d/snippets"))
(yas-global-mode 1)

;;Use pdftools
(pdf-tools-install)

;;Tramp settings
(setq tramp-default-method "ssh")
(put 'dired-find-alternate-file 'disabled nil)

;;Setting pdf viewer for org hyperlinks
(setq org-file-apps
      '((auto-mode . emacs)
        ("\\.pdf\\'" . "zathura %s")))

;;Setting emacs to stop double checking if I want to kill buffers with processes running
(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function kill-buffer-query-functions))

;; Locally changing the 
(add-hook 'org-mode-hook
          (lambda ()
            (define-key evil-insert-state-map (kbd "M-SPC") 'yas-expand)
            (define-key evil-insert-state-map (kbd "M-n") 'yas-next-field)
            (define-key evil-insert-state-map (kbd "M-p") 'yas-prev-field)))