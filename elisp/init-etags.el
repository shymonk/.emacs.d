;; etags


(add-hook 'python-mode-hook
  (lambda ()
    (define-key python-mode-map (kbd "M-i") 'find-tag-other-window)
  )
)
(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (eshell-command 
   (format "find %s -type f -name \"*.py\" | etags -" dir-name)))

(provide 'init-etags)
