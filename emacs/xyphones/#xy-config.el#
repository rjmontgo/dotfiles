;;;* xy-config
(setq myvar 1)

(with-eval-after-load "outline"
  (define-key outline-minor-mode-map (kbd "C-c C-c")
              (lookup-key outline-minor-mode-map (kbd "C-c @"))))

(add-hook 'outline-minor-mode-hook
          (lambda ()
            (define-key outline-minor-mode-map (kbd "C-c C-n") 'outline-next-visible-heading)
            (define-key outline-minor-mode-map (kbd "C-c C-p") 'outline-previous-visible-heading)
            (define-key outline-minor-mode-map (kbd "C-c C-f") 'outline-forward-same-level)
            (define-key outline-minor-mode-map (kbd "C-c C-b") 'outline-backward-same-level)
            (define-key outline-minor-mode-map (kbd "C-c C-u") 'outline-up-heading)
            (define-key outline-minor-mode-map (kbd "C-c C-a") 'outline-show-all)
            (define-key outline-minor-mode-map (kbd "C-c C-c C-a") 'outline-show-all)
            (define-key outline-minor-mode-map (kbd "<Tab>") 'outline-toggle-children)
            (setq outline-minor-mode-cycle t)))


;;;* base options
(setq
 inhibit-startup-message t 
 initial-scratch-message nil 
 use-short-answers t
 sentence-end-double-space nil
 blink-matching-delay 0
 show-paren-delay 0
 visual-bell t
 scroll-margin 10
 make-backup-files nil
 auto-save-default nil
 display-line-numbers-type 'relative
 create-lockfiles nil)
(setq gc-cons-threshold 100000000) ; GC threshold 100MB
(setq max-specpdl-size 5000) 
(setq emacs-cache-dir (concat (getenv "XDG_CACHE_HOME") "/emacs"))
(setq auto-save-list-file-prefix (concat emacs-cache-dir "/auto-save-list"))

(setq-default indent-tabs-mode nil) ; don't you ever insert a tab in my code
(setq-default truncate-lines nil)

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;(unbind-key "Z" dired-mode-map)
                             

;; appearance tweaks
; transparency
(set-frame-parameter nil 'alpha-background 80)
(add-to-list 'default-frame-alist '(alpha-background . 80))

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)
(column-number-mode)
(global-display-line-numbers-mode t)

; fonts 
(set-face-foreground 'font-lock-comment-face "dark gray")
(set-face-attribute 'default nil :font "FiraCode Nerd Font" :height 128)
(add-to-list 'default-frame-alist '(font . "FiraCode Nerd Font" ))

; disable line numbers on certain files
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(add-hook 'dired-mode-hook 'xy/dired-mode-hook)
(defun xy/dired-mode-hook ()
  (define-key dired-mode-map (kbd "Z") nil)
  (define-key dired-mode-map (kbd "<normal-state> Z") nil))

;; set packaging config
(require 'package)

(setq package-user-dir (concat emacs-cache-dir "/elpa"))
(setq lsp-server-install-dir (concat emacs-cache-dir "/lsp"))

(setq package-archives '(
  ("melpa" . "https://melpa.org/packages/")
  ("org" . "https://orgmode.org/elpa/")
  ("elpa" . "https://elpa.gnu.org/packages/")
))


(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

;; install use package
(require 'use-package)
(setq use-package-always-ensure t)

;;;* packages
;; counsel
(use-package counsel
  :config
  (setq ivy-initial-inputs-alist nil))

(use-package vterm
  :ensure t)

;; ivy
(use-package ivy
  :diminish
  :bind (
	 ("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("C-y" . ivy-alt-done)
	 ("C-n" . ivy-next-line)
	 ("C-p" . ivy-previous-line)
	)
  :config
  (ivy-mode 1))
  

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(use-package doom-themes
  :config
  ;; global settings
  (setq doom-themes-enable-bold t
	doom-themes-enable-italics t)
  (load-theme 'doom-gruvbox t))

(use-package visual-fill-column
  :hook (org-mode . xy/zen-mode-visual-fill))
;;;* evil config
(setq evil-want-C-i-jump nil)
(setq evil-want-C-u-scroll t)
(setq evil-want-keybinding nil)
(use-package evil)
(evil-mode 1)

(use-package evil-collection)
(evil-collection-init)

(evil-set-leader 'normal (kbd "SPC"))
(evil-define-key 'normal 'global (kbd "<leader>e") 'dired-jump)
(evil-define-key 'normal 'global (kbd "<leader>x") 'execute-extended-command)

;;;* my funcs
(defun xy/zen-mode-visual-fill ()
  (interactive)
  (setq visual-fill-column-width 120
	visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(defun xy/shell ()
  (interactive)
  (let ((buf (vterm)))
    (switch-to-buffer (other-buffer buf))
    (switch-to-buffer-other-window buf)))

(defun xy/edit-xy-config ()
  (interactive)
  (find-file (concat user-emacs-directory "xyphones/xy-config.el")))

;;;* lsp config
(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (lsp-enable-which-key-integration t)
  (setq lsp-enable-symbol-highlighting nil))

(require 'treesit)

;; instant eldoc
(setq eldoc-idle-delay 0)

;; company mode

;; typescript mode
(use-package typescript-mode
  :mode "\\.ts\\'"
  :hook (typescript-mode . lsp-deferred)
  :config
  (setq typescript-indent-level 2)
  (setq evil-shift-width typescript-indent-level))

;; python mode
(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred
;; nix-mode
(use-package nix-mode
  :mode "\\.nix\\'")

;;;** TreeSitter
(setq treesit-language-source-alist
      '((bash "https://github.com/tree-sitter/tree-sitter-bash")
       (cmake "https://github.com/uyha/tree-sitter-cmake")
       (css "https://github.com/tree-sitter/tree-sitter-css")
       (elisp "https://github.com/Wilfred/tree-sitter-elisp")
       (go "https://github.com/tree-sitter/tree-sitter-go")
       (html "https://github.com/tree-sitter/tree-sitter-html")
       (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
       (json "https://github.com/tree-sitter/tree-sitter-json")
       (make "https://github.com/alemuller/tree-sitter-make")
       (markdown "https://github.com/ikatyang/tree-sitter-markdown")
       (python "https://github.com/tree-sitter/tree-sitter-python")
       (toml "https://github.com/tree-sitter/tree-sitter-toml")
       (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
       (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
       (yaml "https://github.com/ikatyang/tree-sitter-yaml")))
;;;* org config
(defun xy/org-mode-setup ()
  (org-indent-mode)
  (auto-fill-mode 0)
  (visual-line-mode 1)
  (setq evil-auto-indent nil)
  (define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
  (define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
  (define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line))

;; use package org
(use-package org
  ;:pin org
  ;:commands (org-capture org-agenda)
  :hook (org-mode . xy/org-mode-setup)
  :config
  (setq org-ellipsis " ▾")
  (setq org-agenda-files '("~/org/gtd/inbox.org" "~/org/gtd/work.org" "~/org/gtd/personal.org"))
  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)
  (setq org-todo-keywords
        '((sequence "TODO(t)" "WAITING(w)" "NEXT(n)" "|" "DONE(d!)" "CANCELLED(c)")))
  (setq org-tag-alist
        '((:startgroup)
          
          (:endgroup)
          ("@errand" . ?E)
          ("@home" . ?h)
          ("@office" . ?o)
          ("@email" . ?e)
          ("@anywhere" . ?a)
          ("work" . ?w)
          ("personal" . ?p)
          ))

  (setq org-capture-templates
        '(("t" "Inbox Task"
           entry (file "~/org/gtd/inbox.org") "** TODO %?"
           :empty-lines 1
           :prepend t )
          ))
  (setq org-agenda-custom-commands '(("d" "Agenda + Next Actions" ((agenda) (todo "NEXT"))))))

(setq org-return-follows-link t)

(define-key global-map (kbd "C-c t")
            (lambda () (interactive) (org-capture nil "t")))

(define-key global-map (kbd "C-c a") 'org-agenda)
(setq org-refile-targets
    '(("inbox.org" :maxlevel . 2)))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)))

(use-package org-bullets
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))


;;;* outline config
;; Local Variables:
;; outline-regexp: ";;;\\*+\\|\\`"
;; eval: (outline-minor-mode 1)
;; eval: (outline-hide-sublevels 4)
;; End:
