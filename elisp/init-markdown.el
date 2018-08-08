;; markdown-mode

(require-package 'markdown-mode)

(autoload 'gfm-mode "markdown-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; Make windmove work in markdown-mode
(add-hook 'gfm-mode-hook
      (lambda ()
        (local-unset-key (kbd "M-<left>"))
        (local-unset-key (kbd "M-<right>"))
        (local-unset-key (kbd "M-<up>"))
        (local-unset-key (kbd "M-<down>"))))


(add-hook 'gfm-mode-hook
          '(lambda () (visual-line-mode)))


(provide 'init-markdown)
