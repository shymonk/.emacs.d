
(add-to-list 'load-path "~/.emacs.d/elisp/lsp-bridge")

(require 'yasnippet)
(yas-global-mode 1)

(require 'lsp-bridge)
(global-lsp-bridge-mode)
(global-set-key (kbd "C-c .") 'lsp-bridge-find-def-other-window)
(global-set-key (kbd "C-c ,") 'lsp-bridge-find-references)

(add-hook 'c-mode-common-hook
          (lambda ()
            (local-set-key (kbd "C-c .") 'lsp-bridge-find-def-other-window)))

;; https://clangd.llvm.org/installation#project-setup
;; $ cd build && cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ..
(setq lsp-bridge-c-lsp-server "clangd")


(provide 'init-lsp)
