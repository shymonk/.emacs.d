;; "the silver searcher" ack replacment

(require-package 'ag)

(require 'ag)
(setq ag-highlight-search t)
(setq ag-arguments (quote ("--python" "--line-number" "--smart-case" "--nogroup" "--column" "--")))


(defalias 'ag 'ag-project)
(global-set-key (kbd "M-s M-s") 'ag-project)



(provide 'init-search)
