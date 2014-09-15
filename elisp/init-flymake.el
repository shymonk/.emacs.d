(require-package 'flymake-python-pyflakes)
(require-package 'flymake-jshint)

(require 'flymake-python-pyflakes)
(require 'flymake-jshint)
(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
(add-hook 'js-mode-hook (lambda () (flymake-mode t)))

(setq flymake-python-pyflakes-executable "flake8")
(setq flymake-python-pyflakes-extra-arguments '("--ignore=E501"))

(provide 'init-flymake)
