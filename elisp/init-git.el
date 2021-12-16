(use-package magit
  :ensure t)


(defalias 'gitblame 'magit-blame-addition)
;; (defalias 'gitlog 'magit-log)
;; (defalias 'gitco 'magit-checkout)

(provide 'init-git)
