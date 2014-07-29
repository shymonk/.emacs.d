;; web-mode

(require-package 'web-mode)

(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
(setq web-mode-engines-alist '(("django" . "\\.html\\'")))

(defun custom-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 4)
  (setq web-mode-css-indent-offset 4)
  (setq web-mode-code-indent-offset 4)
  (custom-set-faces
   '(web-mode-block-control-face ((t (:inherit web-mode-preprocessor-face))))
   '(web-mode-block-delimiter-face ((t (:inherit web-mode-block-control-face))))
   '(web-mode-css-selector-face ((t (:inherit font-lock-function-name-face))))
   '(web-mode-html-attr-name-face ((t (:inherit font-lock-variable-name-face))))
   '(web-mode-html-tag-face ((t (:inherit font-lock-function-name-face))))
   ;; '(web-mode-keyword-face ((t (:inherit web-mode-preprocessor-face))))
   '(web-mode-preprocessor-face ((t (:inherit web-mode-keyword-face))))
   ;; '(web-mode-preprocessor-face ((t (:foreground "dodger blue"))))
   '(web-mode-variable-name-face ((t (:inherit font-lock-reference-face))))))
(add-hook 'web-mode-hook  'custom-web-mode-hook)


(provide 'init-webmode)
