;; bookmark plus

(require-package 'bookmark+)
(require-package 'bm)


(require 'bookmark+)
(setq bmkp-auto-light-when-set 'Any bookmark)

(require 'bm)
(setq bm-highlight-style 'bm-highlight-only-fringe)
(global-set-key (kbd "<C-f2>") 'bm-toggle)
(global-set-key (kbd "<f2>")   'bm-next)
(global-set-key (kbd "<S-f2>") 'bm-previous)


(provide 'init-bookmark)
