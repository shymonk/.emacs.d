
(require-package 'json-mode)

(require 'json-mode)

(add-to-list 'auto-mode-alist '("\\.json?\\'" . json-mode))
(add-hook 'json-mode-hook (lambda() (json-mode-beautify)))

(provide 'init-json)


