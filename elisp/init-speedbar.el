;; Customize speedbar
(require-package 'sr-speedbar)
(require 'sr-speedbar)
(require 'projectile-speedbar)

(setq speedbar-use-images nil)
(setq speedbar-tag-hierarchy-method nil)
(setq sr-speedbar-right-side nil)
(setq sr-speedbar-width 25)
(setq sr-speedbar-skip-other-window-p t)
(setq sr-speedbar-auto-refresh t)
(setq speedbar-show-unknown-files t)
;; (setq sr-speedbar-max-width 25)

(global-set-key [f5] 'sr-speedbar-toggle)

(provide 'init-speedbar)
