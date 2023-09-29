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


(use-package vterm
  :ensure t)

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



