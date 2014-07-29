;; ido
(require 'ido)
(ido-mode t)
(ido-load-history)
(setq ido-enable-flex-matching t
      ido-everywhere t
      ido-ignore-files '(".DS_Store"))

(provide 'init-ido)
