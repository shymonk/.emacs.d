;; Color Theme

;; (require-package 'color-theme-solarized)
;; (color-theme-initialize)
;; (load-theme 'solarized-dark t)

(require-package 'color-theme-sanityinc-solarized)
(require 'color-theme)
(require 'color-theme-sanityinc-solarized)


(color-theme-sanityinc-solarized-dark)

(defun solarized ()
  "Activate solarized color theme."
  (interactive)
  (color-theme-sanityinc-solarized-dark))

(defun hacker ()
  "Activate subtle-hacker color theme."
  (interactive)
  (color-theme-subtle-hacker))

(provide 'init-theme)
