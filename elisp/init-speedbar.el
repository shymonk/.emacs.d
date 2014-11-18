;; Customize speedbar
(require-package 'sr-speedbar)
(require 'sr-speedbar)

;; TODO: fix bug about toggle in neotree
(global-set-key (kbd "M-s M-s") 'sr-speedbar-toggle)
(setq speedbar-use-images nil)
(setq sr-speedbar-width 30)
(setq sr-speedbar-skip-other-window-p t)
(setq sr-speedbar-auto-refresh t)
(setq sr-speedbar-max-width 25)

(provide 'init-speedbar)
