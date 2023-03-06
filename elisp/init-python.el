
;;; Code:

;;----------------------------------------------------------------------------
;; anaconda-mode and company-mode
;; https://github.com/pythonic-emacs/anaconda-mode
;; https://github.com/company-mode/company-quickhelp
;; 
;;----------------------------------------------------------------------------
(add-hook 'after-init-hook 'global-company-mode)
(global-company-mode t)
(setq company-minimum-prefix-length 1)
(setq company-idle-delay 0)
(company-quickhelp-mode 1)
(setq company-quickhelp-delay 0)
(setq py-install-directory "/usr/local/opt/python/libexec/bin/python")
(add-hook 'python-mode-hook 'anaconda-mode)

(require 'rx)
(eval-after-load "company"
  '(add-to-list 'company-backends 'company-anaconda))

(require 'anaconda-mode)
(define-key anaconda-mode-map (kbd "C-c .") 'anaconda-mode-find-definitions-other-window)
(defalias 'python-def 'anaconda-mode-find-definitions-other-window)
(defalias 'python-doc 'anaconda-mode-show-doc)
(defalias 'python-ref 'anaconda-mode-find-references-other-window)

;;----------------------------------------------------------------------------
;; virtualenvwrapper
;;----------------------------------------------------------------------------
(require 'virtualenvwrapper)
(defalias 'workon 'venv-workon)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell) ;; if you want eshell support
(setq venv-location "/Users/guoqiushi/.virtualenvs")
(add-hook 'python-mode-hook (lambda ()
                             (hack-local-variables)
                             (when (boundp 'project-venv-name)
                               (venv-workon project-venv-name))))
(setq-default mode-line-format (cons '(:exec venv-current-name) mode-line-format))


(provide 'init-python)
