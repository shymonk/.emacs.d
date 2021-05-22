;; https://github.com/nsf/gocode
;; https://github.com/dominikh/yasnippet-go

;; (define-key ac-mode-map (kbd "TAB") 'auto-complete)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "GOPATH"))

(require 'go-mode)
(require 'go-add-tags)
(require 'go-eldoc)
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)
(require 'golint)

(add-to-list 'load-path "~/gocode/src/github.com/dougm/goflymake")
(require 'go-flymake)


(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))


;; (ac-config-default)
(defun go-mode-setup ()
  (go-eldoc-setup)
  (setq gofmt-command "goimports")
  (add-hook 'before-save-hook 'gofmt-before-save)
  (set (make-local-variable 'company-backends) '(company-go))
  (local-set-key (kbd "C-c .") 'godef-jump))
(add-hook 'go-mode-hook 'go-mode-setup)
(add-hook 'go-mode-hook 'company-mode)

(provide 'init-go)

