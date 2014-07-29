(require-package 'flymake-python-pyflakes)
(require-package 'flymake-jshint)

(require 'flymake-python-pyflakes)
(require 'flymake-jshint)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
(add-hook 'js-mode-hook (lambda () (flymake-mode t)))

(provide 'init-flymake)
