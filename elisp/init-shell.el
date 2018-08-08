
(setq eshell-save-history-on-exit t)

(add-hook
 'eshell-mode-hook
 (lambda ()
   (setenv "TERM" "emacs") ; enable colors
   ))

(provide 'init-shell)
