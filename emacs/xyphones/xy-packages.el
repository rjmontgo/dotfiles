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

(use-package visual-fill-column
  :hook (org-mode . xy/zen-mode-visual-fill))
