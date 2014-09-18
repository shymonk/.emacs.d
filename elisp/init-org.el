(setq org-log-done 'time)
(setq org-root "~/org/")

(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)

(defun todo ()
  (interactive)
  (find-file (expand-file-name "todo.org" org-root))
  )
(defun emacs ()
  (interactive)
  (find-file (expand-file-name "emacs.org" org-root))
  )

(provide 'init-org)
