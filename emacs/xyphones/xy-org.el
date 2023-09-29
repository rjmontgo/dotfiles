(defun xy/org-mode-setup ()
  (org-indent-mode)
  (auto-fill-mode 0)
  (visual-line-mode 1)
  (setq evil-auto-indent nil))

;; use package org
(use-package org
  ;:pin org
  ;:commands (org-capture org-agenda)
  :hook (org-mode . xy/org-mode-setup)
  :config (setq org-ellipsis " ▾"))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)))

(use-package org-bullets
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))


