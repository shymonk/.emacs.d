(setq py-install-directory "/usr/bin/python")

(require-package 'pymacs)
(require-package 'python-mode)
(require-package 'virtualenvwrapper)
(require-package 'jedi)

(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-autoload "pymacs")

;;----------------------------------------------------------------------------
;; python-mode
;;----------------------------------------------------------------------------
(require 'python-mode)
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

;;----------------------------------------------------------------------------
;; Preserve backward-kill-word
;;----------------------------------------------------------------------------
(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell) ;; if you want eshell support
(setq venv-location "/Users/john/.virtualenvs/")
(add-hook 'python-mode-hook (lambda ()
                              (hack-local-variables)
                              (when (boundp 'project-venv-name)
                                (venv-workon project-venv-name))))
(setq-default mode-line-format (cons '(:exec venv-current-name) mode-line-format))

;;----------------------------------------------------------------------------
;; jedi for auto-completion
;;----------------------------------------------------------------------------
(setq jedi:complete-on-dot t)
(setq jedi:tooltip-method nil)
(add-hook 'python-mode-hook 'jedi:setup)

;;----------------------------------------------------------------------------
;; Preserve backward-kill-word
;;----------------------------------------------------------------------------
(defun backward-delete-word ()
  "Delete characters backward until encountering the underscore"
  (interactive)
  (modify-syntax-entry ?\_ "_")
  (delete-region (point) (progn (forward-word -1) (point)))
  (modify-syntax-entry ?\_ "w"))
;; (kbd "C-DEL") is not works in MacOS
(define-key py-mode-map (kbd "<C-backspace>") 'backward-delete-word)

;;----------------------------------------------------------------------------
;; Shortcut to enter site-packages
;;----------------------------------------------------------------------------
(defun site-packages ()
  (interactive)
  (find-file-other-window "~/workspace/virtualenvs/sohu/lib/python2.7/site-packages")
  )


(provide 'init-python)
