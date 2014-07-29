;; visual-regexp

(require-package 'visual-regexp)

(require 'visual-regexp)
(define-key global-map (kbd "C-c r") 'vr/replace)
(define-key global-map (kbd "C-c q") 'vr/query-replace)

(provide 'init-visual-regexp)
