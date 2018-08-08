;; hs-minor-mode

(load-library "hideshow")
(add-hook 'python-mode-hook (lambda () (hs-minor-mode 1)))
(add-hook 'js-mode-hook (lambda () (hs-minor-mode 1)))
(add-hook 'html-mode-hook (lambda () (hs-minor-mode 1)))
(global-set-key (kbd "C--") 'hs-hide-all)
(global-set-key (kbd "C-=") 'hs-show-all)
(global-set-key (kbd "C-+") 'hs-toggle-hiding)

(provide 'init-hideshow)
