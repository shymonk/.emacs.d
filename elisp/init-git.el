;; git-gutter

(require-package 'git-gutter)
(require-package 'magit)

(require 'magit)
(defalias 'gitblame 'magit-blame-mode)
(defalias 'gitlog 'magit-log)


(require 'git-gutter)
(global-git-gutter-mode +1)


(provide 'init-git)
