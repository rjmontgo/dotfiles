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
