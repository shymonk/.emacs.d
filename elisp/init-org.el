(setq org-log-done 'time)
(setq org-root "~/org/")

(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)

;; this line activates ditaa
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ditaa . t)))

(eval-after-load "org"
  '(require 'ox-md nil t))

(defun initel ()
  (interactive)
  (find-file (expand-file-name "init.el" user-emacs-directory))
  )

(defun todo ()
  (interactive)
  (find-file (expand-file-name "todo.org" org-root))
  )
(defun emacs ()
  (interactive)
  (find-file (expand-file-name "emacs.org" org-root))
  )

(provide 'init-org)
