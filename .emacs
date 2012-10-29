;; 避免多个客户端启动
(server-start)
;; 关闭开机画面
(setq inhibit-startup-message t)
;; 光标显示为一竖线
(setq-default cursor-type 'bar)
;; 没有提示音，也不闪屏。
(setq ring-bell-function 'ignore)
;; 光标靠近鼠标时鼠标跳开
(mouse-avoidance-mode 'animate)
;; default major mode
(setq default-major-mode 'text-mode)
;; 在minibuffer里启用自动补全函数和变量
(icomplete-mode t)
;; show match parenthesis
(show-paren-mode t)
(setq show-paren-style 'parentheses)
;; syntax highlight
(global-font-lock-mode t)
(setq x-select-enable-clipboard t)
;; Set default tab width to 4 spaces
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
(setq c-basic-offset 4)

;; input chinese by ibus
;; only available in ubuntu
(add-to-list 'load-path "/.emacs.d/plugins/ibus")
(require 'ibus) 
(add-hook 'after-init-hook 'ibus-mode-on) 

;; toggle full Screen
;; only available in ubuntu 
(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                           nil
                                           'fullboth)))
(global-set-key [(meta return)] 'toggle-fullscreen)

;; bookmark plus
(add-to-list 'load-path "~/.emacs.d/plugins/bookmark+")
(require 'bookmark+)

;; register
(global-set-key [(control f2)] 'ska-point-to-register)
(global-set-key [f2] 'ska-jump-to-register)
(defun ska-point-to-register()
  "Store cursorposition _fast_ in a register. 
Use ska-jump-to-register to jump back to the stored 
position."
  (interactive)
  (setq zmacs-region-stays t)
  (point-to-register 8))

(defun ska-jump-to-register()
  "Switches between current cursorposition and position
that was stored with ska-point-to-register."
  (interactive)
  (setq zmacs-region-stays t)
  (let ((tmp (point-marker)))
        (jump-to-register 8)
        (set-register 8 tmp)))

;; copy line function
(defun copy-line(&optional arg)
(interactive "p")
(kill-line arg)
(yank))
(global-set-key (kbd "C-;") 'copy-line)

;;Color Theme
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

;; Cscope
(add-to-list 'load-path "~/.emacs.d/plugins/cscope")
(require 'xcscope)

;; Yasnippet
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas/global-mode 1)

;; Auto-complete
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete")
;(require 'auto-complete-config)
;(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/auto-complete/ac-dict")
;(ac-config-default)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(setq-default ac-sources '(ac-source-words-in-same-mode-buffers))
(add-hook 'emacs-lisp-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-symbols)))
(add-hook 'auto-complete-mode-hook (lambda () (add-to-list 'ac-sources 'ac-source-filename)))
(set-face-background 'ac-candidate-face "lightgray")
(set-face-underline 'ac-candidate-face "darkgray")
(set-face-background 'ac-selection-face "steelblue") 
(define-key ac-completing-map "\M-n" 'ac-next)  ;;; 列表中通过按M-n来向下移动
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

;; 使用 C-k 删除整行
(setq-default kill-whole-line t)
;; 设置 kill-ring 的大小
(setq kill-ring-max 50)
;; use y-or-n instead of yes-or-no
(defalias 'yes-or-no-p 'y-or-n-p)
;; title text
(setq frame-title-format "emacs@%b %f")
;; 高亮显示选中区域
(transient-mark-mode t)

(setq-default make-backup-files nil)
;; show line number & column number
(setq column-number-mode t)
(setq line-number-mode t)
;; show time & date
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(display-time)
;; bookmark file, it just like browser's bookfile
(global-set-key [f9] 'list-bookmarks)
(global-set-key [(shift f9)] 'bookmark-set)

;; F1 CUA-Mode
(global-set-key [f1] 'cua-mode)
;; F3 toggle-read-only
(global-set-key [f3] 'toggle-read-only) 
;; F4 kill-this-buffer
(global-set-key [f4] 'kill-this-buffer)
;; F5 sr-speedbar toggle
(global-set-key [f5] 'sr-speedbar-toggle)
;; F6 replace-string
(global-set-key [f6] 'replace-string)
;; F11 terminal
(global-set-key [f11] 'term) 
;; F12 save-buffer 
(global-set-key [f12] 'save-buffer);

(global-set-key [(meta ?/)] 'hippie-expand)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(bmkp-last-as-first-bookmark-file "~/.emacs.bmk")
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes nil)
 '(display-time-mode t)
 '(scroll-bar-mode (quote right))
 '(tool-bar-mode nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "darkslategrey" :foreground "wheat" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 136 :width normal :foundry "misc" :family "Ubuntu Mono")))))
