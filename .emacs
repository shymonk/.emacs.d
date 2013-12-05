;; emacs setting
;; hellojohn201@gmail.com

;; F1  CUA-Mode
;; F3  toggle-read-only
;; F4  kill-this-buffer
;; F5  sr-speedbar toggle
;; F6  replace-string
;; F10 python-shell
;; F11 terminal
;; F12 save-buffer 


;; config for *nix platform

;; ibut imput method 
;; (add-to-list 'load-path "/.emacs.d/plugins/ibus")
;; (require 'ibus)

;; toggle fullscreen
(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                           nil 'fullboth)))
(global-set-key [(meta return)] 'toggle-fullscreen)

;; config for *nix and windows platform

(setq inhibit-startup-message t)
(setq-default cursor-type 'bar)
(setq ring-bell-function 'ignore)
(mouse-avoidance-mode 'animate)
(setq default-major-mode 'text-mode)
(icomplete-mode t)
(show-paren-mode t) 
(setq show-paren-style 'parentheses)
(global-font-lock-mode t)
(setq x-select-enable-clipboard t)
(setq toggle-read-only t)
(setq default-buffer-file-coding-system 'utf-8)
;; set the default text coding system(read)
;; (prefer-coding-system 'utf-8)
(set-default 'truncate-lines t)
(setq-default kill-whole-line t)
(setq kill-ring-max 50)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq frame-title-format "emacs@%b %f")
(transient-mark-mode t)
(setq-default make-backup-files nil)
(setq column-number-mode t)
(setq line-number-mode t)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(display-time)
(set-fontset-font "fontset-default" 'gb18030'("Î¢ÈíÑÅºÚ" . "unicode-bmp"))
(global-auto-revert-mode)
(setq default-directory "E:\\")
;; (desktop-save-mode 1) ;; open recently file


(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
(setq c-basic-offset 4)
(add-hook 'html-mode-hook (lambda () (setq sgml-basic-offset 4)))
(add-hook 'python-mode-hook(lambda () (setq tab-width 4) (setq python-indent 4)))


;; ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)
(defun kill-other-buffers ()
      "Kill all other buffers."
      (interactive)
      (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

;; bookmark plus
(add-to-list 'load-path "~/.emacs.d/plugins/bookmark+")
(require 'bookmark+)
(setq bmkp-auto-light-when-set 'Any bookmark)
(global-set-key [(control f2)] 'bookmark-set)
(global-set-key [f2] 'bmkp-next-bookmark-this-file/buffer-repeat)

;; markdown-mode
(add-to-list 'load-path "~/.emacs.d/plugins/modes")
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; folding code
(load-library "hideshow")
(add-hook 'python-mode-hook (lambda () (hs-minor-mode 1)))
(global-set-key (kbd "C--") 'hs-hide-all)
(global-set-key (kbd "C-=") 'hs-show-all)
(global-set-key (kbd "C-+") 'hs-toggle-hiding)

;; copy line
(defun copy-line(&optional arg)
(interactive "p")
(kill-line arg)
(yank))
(global-set-key (kbd "C-;") 'copy-line)

;; unicad
(add-to-list 'load-path "~/.emacs.d/plugins/unicad")
(require 'unicad)

;; Color Theme
(add-to-list 'load-path "~/.emacs.d/plugins/color-theme-6.6.0")
(require 'color-theme)
(color-theme-initialize)
(color-theme-subtle-hacker)

;; Line Number
(add-to-list 'load-path "~/.emacs.d/plugins/linum")
(require 'linum)
(global-linum-mode 1)

;; Highlight Symbol
(add-to-list 'load-path "~/.emacs.d/plugins/highlight-symbol")
(require 'highlight-symbol)
(global-set-key [(shift f8)] 'highlight-symbol-at-point)
(global-set-key [f8] 'highlight-symbol-next)
(global-set-key [(control f8)] 'highlight-symbol-prev)
(global-set-key [(meta f8)] 'highlight-symbol-prev)

;; sr-speedbar
(add-to-list 'load-path "~/.emacs.d/plugins/sr-speedbar")
(require 'sr-speedbar)
(setq sr-speedbar-width 30)
(setq speedbar-show-unknown-files t)
(setq dframe-update-speed t)

;; Cscope
(add-to-list 'load-path "~/.emacs.d/plugins/cscope")
(require 'xcscope)

;; Whitespace
(add-to-list 'load-path "~/.emacs.d/plugins/whitespace")
(require 'whitespace)

;; Yasnippet
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas/global-mode 1)

;; Tramp
(require 'tramp)

;; Tabbar
(add-to-list 'load-path "~/.emacs.d/plugins/tabbar")
;; (setq tabbar-buffer-groups-function nil)
(require 'tabbar)
(tabbar-mode t)
(set-face-attribute 'tabbar-default nil
                    :family "Vera Sans YuanTi Mono"
                    :background "gray80"
                    :foreground "gray30"
                    :height 1.0)
(set-face-attribute 'tabbar-button nil
                    :inherit 'tabbar-default
                    :box '(:line-width 1 :color "gray30"))
(set-face-attribute 'tabbar-selected nil
                    :inherit 'tabbar-default
                    :foreground "DarkGreen"
                    :background "LightGoldenrod"
                    :box '(:line-width 2 :color "DarkGoldenrod")
                    ;; :overline "black"
                    ;; :underline "black"
                    :weight 'bold)
(set-face-attribute 'tabbar-unselected nil
                    :inherit 'tabbar-default
                    :box '(:line-width 2 :color "gray70"))


;; Auto-complete
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete")
(require 'auto-complete-config)
(global-auto-complete-mode t)
(setq-default ac-sources '(ac-source-words-in-same-mode-buffers))
(add-hook 'emacs-lisp-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-symbols)))
(add-hook 'auto-complete-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-filename)))
(set-face-background 'ac-candidate-face "lightgray")
(set-face-underline 'ac-candidate-face "darkgray")
(set-face-background 'ac-selection-face "steelblue") 
(define-key ac-completing-map "\M-n" 'ac-next)
(define-key ac-completing-map "\M-p" 'ac-previous)
(setq ac-auto-start 2)
(setq ac-dwim t)
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

;; Pymacs
(add-to-list 'load-path "~/.emacs.d/plugins/pinard-Pymacs-4be2c15")
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-autoload "pymacs")

;; Pycomplete
;(add-to-list 'load-path "~/.emacs.d/plugins/pycomplete")
;(require 'pycomplete)
;(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
;(setq interpreter-mode-alist(cons '("python" . python-mode)
;                             interpreter-mode-alist))
;(setq py-python-command "python")
;(autoload 'python-mode "python-mode" "Python editing mode." t)

;; Pylint
(setq python-check-command "pylint")
(when (load "flymake" t)
      (defun flymake-pylint-init ()
        (let* ((temp-file (flymake-init-create-temp-buffer-copy
                           'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
          (list "epylint" (list local-file))))
      (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pylint-init)))


(global-set-key [f1] 'python-check)
(global-set-key [f3] 'toggle-read-only) 
(global-set-key [f4] 'kill-this-buffer)

(global-set-key [f5] 'sr-speedbar-toggle)
(global-set-key [f6] 'replace-string)
(global-set-key [f9] 'list-bookmarks)
(global-set-key [(shift f9)] 'bookmark-set)

(global-set-key [f10] 'python-shell)
(global-set-key [f11] 'term) 
(global-set-key [f12] 'save-buffer);

(global-set-key [(meta ?/)] 'hippie-expand)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(bmkp-last-as-first-bookmark-file "~/.emacs.bmk")
 '(column-number-mode t)
 '(display-time-mode t)
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(speedbar-frame-parameters (quote ((minibuffer) (width . 30) (border-width . 0) (menu-bar-lines . 0) (tool-bar-lines . 0) (unsplittable . t) (left-fringe . 0))))
 '(tool-bar-mode nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "darkslategrey" :foreground "wheat" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 143 :width normal :foundry "outline" :family "Consolas"))))
 '(whitespace-space ((((class color) (background dark)) (:background "darkslategrey" :foreground "darkgray")))))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
