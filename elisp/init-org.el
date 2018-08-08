(setq org-log-done 'time)
(setq org-root "~/org/")

(setq org-support-shift-select t)
(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)
(setq org-export-with-section-numbers nil)
(setq org-export-with-toc nil)
(setq org-replace-disputed-keys t)

;; Make windmove work in org-mode:
(add-hook 'org-metaup-hook 'windmove-up)
(add-hook 'org-metaleft-hook 'windmove-left)
(add-hook 'org-metadown-hook 'windmove-down)
(add-hook 'org-metaright-hook 'windmove-right)

;; this line activates ditaa
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ditaa . t)))

(eval-after-load "org"
  '(require 'ox-md nil t))

(add-hook 'org-mode-hook
          '(lambda ()
             (setq visual-line-fringe-indicators t)
             (visual-line-mode)
             (if visual-line-mode
                 (setq word-wrap nil))))

(defun initel ()
  "A shotcut for init.el"
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

(defun orgroot ()
  "A shotcut to enter blog posts dir"
  (interactive)
  (find-file-other-window org-root)
  )


(provide 'init-org)
