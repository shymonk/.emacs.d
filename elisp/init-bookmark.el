;; bookmark 

(use-package bm
  :ensure t
  ;; :config
  :bind-keymap
  ("C-c m" .  bm-toggle)
  ("<F2>" .   bm-next)
  ("S-<F2>" . bm-previous))

(defalias 'bookmarks 'list-bookmarks)


(provide 'init-bookmark)
