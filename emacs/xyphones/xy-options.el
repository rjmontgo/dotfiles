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
(set-face-foreground 'font-lock-comment-face "light gray")
(set-face-attribute 'default nil :font "FiraCode Nerd Font" :height 128)

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

;; set custom vars file and load it
(setq custom-file (make-temp-name "/tmp/"))
(setq custom-safe-themes t)
