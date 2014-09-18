;; Pymacs

(setq py-install-directory "/usr/bin/python")

(require-package 'pymacs)
(require-package 'python-mode)
(require-package 'jedi)

(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-autoload "pymacs")

(require 'python-mode)
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(setq jedi:tooltip-method nil)
;; A shortcut to enter site-packages
(defun site-packages ()
  (interactive)
  (find-file-other-window "~/workspace/virtualenvs/sohu/lib/python2.7/site-packages")
  )

(provide 'init-python)
