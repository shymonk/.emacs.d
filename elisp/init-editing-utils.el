
(setq-default
 show-trailing-whitespace t
 visible-bell t)


;; Set mark
(global-set-key (kbd "C-.") 'set-mark-command)

;; Newline
(global-set-key (kbd "RET") 'newline-and-indent)
(defun shymonk/newline-at-end-of-line ()
  "Move to end of line, enter a newline, and reindent."
  (interactive)
  (move-end-of-line 1)
  (newline-and-indent))

(global-set-key (kbd "<S-return>") 'sanityinc/newline-at-end-of-line)

;;----------------------------------------------------------------------------
;; Expand region
;;----------------------------------------------------------------------------
(require-package 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)


;; copy line
(defun copy-line ()
  "Copy current line, or current text selection."
  (interactive)
  (if (region-active-p)
      (kill-ring-save (region-beginning) (region-end))
    (kill-ring-save (line-beginning-position) (line-beginning-position 2))))
(global-set-key (kbd "C-;") 'copy-line)


(provide 'init-editing-utils)

