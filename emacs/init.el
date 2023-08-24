(setq inhibit-startup-message t)
(setq truncate-lines t)
(setq blink-matching-delay 0)
(setq show-paren-delay 0)
(setq visual-bell t)
(setq scroll-margin 10)
(setq dired-deletion-confirmer #'y-or-n-p)
(setq backup-directory-alist `(("." . "~/.cache/emacs/saves")))
(setq backup-by-copying t)

(set-frame-parameter nil 'alpha-background 80)
(add-to-list 'default-frame-alist '(alpha-background . 80))
(set-face-foreground 'font-lock-comment-face "light gray")

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)

(menu-bar-mode -1)

(set-face-attribute 'default nil :font "FiraCode Nerd Font" :height 128)
(load-theme 'tango-dark)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(column-number-mode)
(global-display-line-numbers-mode t)

(require 'package)

(setq package-archives '(
  ("melpa" . "https://melpa.org/packages/")
  ("org" . "https://orgmode.org/elpa/")
  ("elpa" . "https://elpa.gnu.org/packages/")
))

(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; evil mode
(unless (package-installed-p 'evil)
  (package-install 'evil))

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

;; counsel
(use-package counsel
  :config
  (setq ivy-initial-inputs-alist nil))

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
  (load-theme 'doom-palenight t))

(defun xy/org-mode-setup ()
  (org-indent-mode)
  ;(variable-pitch-mode 1)
  (auto-fill-mode 0)
  (visual-line-mode 1)
  (setq evil-auto-indent nil))

(defun xy/zen-mode-visual-fill ()
  (interactive)
  (setq visual-fill-column-width 120
	visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . xy/zen-mode-visual-fill))

;; use package org
(use-package org
  ;:pin org
  ;:commands (org-capture org-agenda)
  :hook (org-mode . xy/org-mode-setup)
  :config
  (setq org-ellipsis " ▾"))

(use-package org-bullets
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(use-package eglot
  :ensure t
  :defer t
  :config
    (add-to-list 'eglot-server-programs
		 '(svelte-mode . ("svelteserver" "--stdio")))
  :hook
    (typescript-ts-mode . eglot-ensure))

(use-package sly)
(add-to-list 'load-path "~/dir/to/cloned/sly")
(require 'sly-autoloads)

(use-package company)

(setq inferior-lisp-program "/nix/store/122j73k4f0y6ai6v0pm5kqvk9c1dy2a6-sbcl-2.3.7/bin/sbcl")

;; load customize 
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)
