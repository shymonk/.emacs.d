;; fiplr

(require-package 'fiplr)

(setq fiplr-ignored-globs '((directories (".git" ".svn" "elpa"))
                            (files ("*.pyc" "*.jpg" "*.png" "*.zip" "*~"))))

(global-set-key (kbd "M-`") 'fiplr-find-file)
(provide 'init-fiplr)

