(setq org-log-done 'time)
(setq org-root "~/org/")

(defun todo ()
  (interactive)
  (find-file (expand-file-name "todo.org" org-root))
  )
(defun emacs ()
  (interactive)
  (find-file (expand-file-name "emacs.org" org-root))
  )

(provide 'init-org)
