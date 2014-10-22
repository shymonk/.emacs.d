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

(provide 'init-misc)
