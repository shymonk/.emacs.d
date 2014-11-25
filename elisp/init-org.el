(setq org-log-done 'time)
(setq org-root "~/org/")

(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)
(setq org-export-with-section-numbers nil)
(setq org-export-with-toc nil)

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

;; A shotcut to enter blog posts dir
(defun orgroot ()
  (interactive)
  (find-file-other-window org-root)
  )


(provide 'init-org)
