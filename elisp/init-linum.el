;; Line Number

(require-package 'linum)

(require 'linum)
(global-linum-mode 1)

(defun turn-off-linum-mode ()
  "Turn off linum-mode"
  (linum-mode 0)
  )
(add-hook 'text-mode-hook 'turn-off-linum-mode)
(add-hook 'xml-mode-hook 'turn-off-linum-mode)

(provide 'init-linum)
