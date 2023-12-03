
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

;; fix error "Invalid image type ‘svg’"
;; overriding image.el function image-type-available-p
(defun image-type-available-p (type)
  "Return t if image type TYPE is available.
Image types are symbols like `xbm' or `jpeg'."
  (if (eq 'svg type)
      nil
    (and (fboundp 'init-image-library)
         (init-image-library type))))

(provide 'init-lsp)
