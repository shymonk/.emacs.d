(require-package 'sr-speedbar)

(require 'sr-speedbar)
(setq speedbar-hide-button-brackets-flag t
      speedbar-smart-directory-expand-flag t
      speedbar-show-unknown-files t
      speedbar-use-images nil
      sr-speedbar-auto-refresh nil
      sr-speedbar-skip-other-window-p t
      sr-speedbar-width 30
      dframe-update-speed t)

(global-set-key [f5] 'sr-speedbar-toggle)
(global-set-key (kbd "C-\\") 'sr-speedbar-select-window)
;; FIXME: defun speedbar-switch-window

(provide 'init-speedbar)
