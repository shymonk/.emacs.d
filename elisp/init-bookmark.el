;; bookmark plus

(require-package 'bookmark+)

(require 'bookmark+)
(setq bmkp-auto-light-when-set 'Any bookmark)

(global-set-key [(control f2)] 'bookmark-set)
(global-set-key [f2] 'bmkp-next-bookmark-this-file/buffer-repeat)

(provide 'init-bookmark)
