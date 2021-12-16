;; highlight symbol

(use-package highlight-symbol
  :ensure t
  :bind (:map global-map
              ;; ("S-f8" . highlight-symbol-at-point)
              ("<f8>" . highlight-symbol-next)
              ("C-f8" . highlight-symbol-prev)
              ("M-f8" . highlight-symbol-prev)))


;; (global-set-key [(shift f8)] 'highlight-symbol-at-point)
;; (global-set-key [f8] 'highlight-symbol-next)
;; (global-set-key [(control f8)] 'highlight-symbol-prev)
;; (global-set-key [(meta f8)] 'highlight-symbol-prev)


(provide 'init-highlight)
