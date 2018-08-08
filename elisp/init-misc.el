;; toggle fullscreen
(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                           nil 'fullboth)))
(global-set-key [(meta return)] 'toggle-fullscreen)

;; whitespace-mode
(require 'whitespace)

(defun copy-file-path ()
  "Copy buffer's full path to kill ring"
  (interactive)
  (message (buffer-file-name))
  (when buffer-file-name
    (kill-new buffer-file-name)))


;; backup file
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(message "Deleting old backup files...")
(let ((week (* 60 60 24 7))
      (current (float-time (current-time))))
  (dolist (file (directory-files temporary-file-directory t))
    (when (and (backup-file-name-p file)
               (> (- current (float-time (fifth (file-attributes file))))
                  week))
      (message "%s" file)
      (delete-file file))))

(provide 'init-misc)
