;; fiplr

(require-package 'fiplr)

(setq fiplr-ignored-globs '((directories (".git" ".svn"))
                            (files ("*.pyc" "*.jpg" "*.png" "*.zip" "*~"))))

(global-set-key (kbd "M-`") 'fiplr-find-file)
(provide 'init-fiplr)

