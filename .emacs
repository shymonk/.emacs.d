;; 避免多个客户端启动
(server-start)
;; 关闭开机画面
(setq inhibit-startup-message t)
;; 光标显示为一竖线
(setq-default cursor-type 'bar)
;; 没有提示音，也不闪屏。
(setq ring-bell-function 'ignore)
;; 自動保存設置 
(setq auto-save-mode t)
;; 光标靠近鼠标时鼠标跳开
(mouse-avoidance-mode 'animate)
;; 去掉那个大大的工具栏
;;(tool-bar-mode nil)
;; 默认的主模式
(setq default-major-mode 'text-mode)
;; 在minibuffer里启用自动补全函数和变量
(icomplete-mode t)
;; 语法高亮
(global-font-lock-mode t)
;;支持emacs和外部程序的粘贴
(setq x-select-enable-clipboard t)
;;Set default read only mode
(setq toggle-read-only t)
;;Set default tab width to 4 spaces
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
(setq c-basic-offset 4)

(add-to-list 'load-path "/.emacs.d/plugins/ibus")
(require 'ibus) 
(add-hook 'after-init-hook 'ibus-mode-on) 

;; Full Screen
(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                           nil
                                           'fullboth)))
(global-set-key [(meta return)] 'toggle-fullscreen)

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
;;(add-hook 'c-mode-common-hook
;;  '(lambda ()
;;    (require 'xcscope)))
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
(set-face-background 'ac-selection-face "steelblue") ;;; 设置比上面截图中更好看的背景颜色
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

;; 在 mode-line 中显示列号
(setq column-number-mode t)
;; 使用 C-k 删除整行
(setq-default kill-whole-line t)
;; 设置 kill-ring 的大小
(setq kill-ring-max 50)
;; 备份文件目录
(setq backup-by-copying t) ; 自动备份
;;自动备份目录~/.emacs.d/backup
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))) 
(setq delete-old-versions t) ; 自动删除旧的备份文件
(setq kept-new-versions 2) ; 保留最近的3个备份文件
(setq kept-old-versions 1) ; 保留最早的2个备份文件
(setq version-control t) ; 多次备份
;; 不要问 yes-or-no，只问 y-or-n
(defalias 'yes-or-no-p 'y-or-n-p)
;; 设置 emacs 的标题
(setq frame-title-format "emacs@%b %f")
;; 可以显示图片
(auto-image-file-mode)
;; 高亮显示选中区域
(transient-mark-mode t)
;;;不要生成备份文件
(setq-default make-backup-files nil)
;;;; 显示行号
(setq column-number-mode t)
(setq line-number-mode t)
;;;; 显示时间
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(display-time)

;; F1 CUA-Mode
(global-set-key [f1] 'cua-mode)
;; F2 undo
(global-set-key [f2] 'undo) 
;; F3 toggle-read-only
(global-set-key [f3] 'toggle-read-only) 
;; F4 kill-this-buffer
(global-set-key [f4] 'kill-this-buffer)
;; F5 sr-speedbar toggle
(global-set-key [f5] 'sr-speedbar-toggle)
;; F6 replace-string
(global-set-key [f6] 'replace-string)
;; F11 eshell
(global-set-key [f11] 'eshell) 
;; F12 save-buffer 
(global-set-key [f12] 'save-buffer);

;;绑定按键 
(global-set-key [(meta ?/)] 'hippie-expand)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
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
