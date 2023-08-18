;; https://github.com/nsf/gocode
;; https://github.com/dominikh/yasnippet-go

;; (define-key ac-mode-map (kbd "TAB") 'auto-complete)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

(require 'go-mode)


(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

(add-hook 'go-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'gofmt-before-save)
            (setq tab-width 4)
            (setq indent-tabs-mode nil)))

(provide 'init-go)

