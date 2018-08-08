(setq py-install-directory "/usr/bin/python")

(require-package 'pymacs)
(require-package 'python-mode)
(require-package 'virtualenvwrapper)
(require-package 'jedi)

(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-autoload "pymacs")

;;----------------------------------------------------------------------------
;; python-mode
;;----------------------------------------------------------------------------
(require 'python-mode)
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

;;----------------------------------------------------------------------------
;; Preserve backward-kill-word
;;----------------------------------------------------------------------------
(require 'virtualenvwrapper)
(defalias 'workon 'venv-workon)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell) ;; if you want eshell support
(setq venv-location "/Users/john/.virtualenvs/")
(add-hook 'python-mode-hook (lambda ()
                              (hack-local-variables)
                              (when (boundp 'project-venv-name)
                                (venv-workon project-venv-name))))
(setq-default mode-line-format (cons '(:exec venv-current-name) mode-line-format))

;;----------------------------------------------------------------------------
;; jedi for auto-completion
;;----------------------------------------------------------------------------
(setq jedi:complete-on-dot t)
(setq jedi:tooltip-method nil)
(add-hook 'python-mode-hook 'jedi:setup)

;;----------------------------------------------------------------------------
;; Preserve backward-kill-word
;;----------------------------------------------------------------------------
(defun backward-delete-word ()
  "Delete characters backward until encountering the underscore"
  (interactive)
  (modify-syntax-entry ?\_ "_")
  (delete-region (point) (progn (forward-word -1) (point)))
  (modify-syntax-entry ?\_ "w"))
;; (kbd "C-DEL") is not works in MacOS
;; (define-key py-mode-map (kbd "<C-backspace>") 'backward-delete-word)

;;----------------------------------------------------------------------------
;; Hide/Show code block
;;----------------------------------------------------------------------------

(add-hook 'python-mode-hook
          (lambda ()
            (hs-minor-mode)
            (defalias 'hideall 'hs-hide-all)
            (defalias 'showall 'hs-show-all)
            (global-set-key (kbd "<backtab>") 'hs-toggle-hiding)))

(defface codepilot-folding-overlay
  '((default (:inherit region :box (:line-width 1 :color "DarkSeaGreen1" :style released-button)))
    (((class color)) (:background "DarkSeaGreen2" :foreground "black")))
  "*Font used by folding overlay."
  :group 'codepilot)

(defun cptree-ov-delete ()
  (interactive)
  (dolist (o (overlays-at (point)))
    (cptree-delete-overlay o 'cptree)))

(defvar cptree--overlay-keymap nil "keymap for folding overlay")

(unless cptree--overlay-keymap
  (let ((map (make-sparse-keymap)))
    (define-key map [mouse-1] 'cptree-ov-delete)
    (define-key map "\r" 'cptree-ov-delete)
    (setq cptree--overlay-keymap map)))

(defun cptree-delete-overlay(o prop)
  (when (eq (overlay-get o 'cptree-tag) prop)
    (delete-overlay o)
    t))

(defun cptree-hide-region (from to prop)
  "Hides a region by making an invisible overlay over it and save the
overlay on the hide-region-overlays \"ring\""
  (interactive)
  (let ((new-overlay (make-overlay from to)))
    ;;(overlay-put new-overlay 'invisible nil)
    (overlay-put new-overlay 'cptree-tag prop)
    (overlay-put new-overlay 'face 'codepilot-folding-overlay)
    (overlay-put new-overlay 'display
                 (propertize
                  (format "...<%d lines>..."
                          (1- (count-lines (overlay-start new-overlay)
                                           (overlay-end new-overlay))))))
    (overlay-put new-overlay 'priority (- 0 from))
    (overlay-put new-overlay 'keymap cptree--overlay-keymap)
    (overlay-put new-overlay 'pointer 'hand)))

(require 'python)

(defun mypython-fold/unfold-block ()
  "fold the block"
  (interactive)
  (let (ret b e)
    (dolist (o (overlays-at (if (python-open-block-statement-p)
                                (save-excursion
                                  (python-end-of-statement)
                                  (point)
                                  )
                              (point))))
      (when (cptree-delete-overlay o 'cptree)
        (setq ret t)))
    (unless ret
      (save-excursion
        (unless (python-open-block-statement-p)
          (python-beginning-of-block))
        (python-end-of-statement)
        (setq b (point))
        (python-end-of-block)
        (setq e (1- (point)))
        (cptree-hide-region b e 'cptree)))))

(define-key python-mode-map [(f10)] 'mypython-fold/unfold-block)

;;----------------------------------------------------------------------------
;; Shortcut to enter site-packages
;;----------------------------------------------------------------------------
(defun site-packages ()
  (interactive)
  (find-file-other-window "~/workspace/virtualenvs/sohu/lib/python2.7/site-packages")
  )


(provide 'init-python)
