
(add-to-list 'load-path "~/.emacs.d/elisp/lsp-bridge")

(require 'yasnippet)
(yas-global-mode 1)

(require 'lsp-bridge)
(global-lsp-bridge-mode)
(global-set-key (kbd "C-c .") 'lsp-bridge-find-def-other-window)
(global-set-key (kbd "C-c ,") 'lsp-bridge-find-references)


(provide 'init-lsp)
