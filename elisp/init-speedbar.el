;; Customize speedbar
(require-package 'sr-speedbar)
(require 'sr-speedbar)
(require 'projectile-speedbar)

(setq speedbar-use-images nil)
(setq speedbar-tag-hierarchy-method nil)
(setq sr-speedbar-right-side nil)
(setq sr-speedbar-width 25)
(setq sr-speedbar-skip-other-window-p t)
(setq sr-speedbar-auto-refresh nil)
(setq speedbar-show-unknown-files t)
;; (setq sr-speedbar-max-width 25)

(defun sr-speedbar-change-root (path)
  "Change root to PATH."
  (interactive "DDirectory: ")
  (projectile-speedbar-project-refresh path)
  )
(define-key speedbar-mode-map (kbd "C-c C-c") 'sr-speedbar-change-root)
(global-set-key [f5] 'sr-speedbar-toggle)
(setq speedbar-directory-unshown-regexp "^\\(CVS\\|RCS\\|SCCS\\|\\.\\.*$\\)\\'")

(provide 'init-speedbar)
