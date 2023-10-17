(add-to-list 'load-path (concat (getenv "XDG_CONFIG_HOME") "/emacs/xyphones"))

(load-library "xy-config")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("680f62b751481cc5b5b44aeab824e5683cf13792c006aeba1c25ce2d89826426" "60ada0ff6b91687f1a04cc17ad04119e59a7542644c7c59fc135909499400ab8" "e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" "631c52620e2953e744f2b56d102eae503017047fb43d65ce028e88ef5846ea3b" default))
 '(safe-local-variable-values
   '((eval setq-local outline-level
           #'(lambda nil
               (-
                (match-end 0)
                (match-beginning 0))))
     (eval outline-hide-sublevels 4))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
