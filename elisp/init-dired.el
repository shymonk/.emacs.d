(require-package 'dired+)

(setq diredp-hide-details-initially-flag nil)
(require 'dired+)
(require 'dired-x)
;; (setq-default dired-omit-files-p t)
;; (setq dired-omit-files (concat dired-omit-files "\\|^\\..+$"))

(provide 'init-dired)
