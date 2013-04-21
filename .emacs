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
;; enable to paste from other app
(setq x-select-enable-clipboard t)
;;Set default read only mode
(setq toggle-read-only t)
;;Set default tab width to 4 spaces
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
(setq c-basic-offset 4)
;; Set default directory when c+x c+f
;;(setq default-directory "E:\\")
;; auto reload file
(global-auto-revert-mode)

(add-hook 'python-mode-hook
          (lambda ()
            (set-variable 'py-indent-offset 4)
            ;(set-variable 'py-smart-indentation nil)
            (set-variable 'indent-tabs-mode nil)))



;; input chinese by ibus
;; only available in ubuntu
(add-to-list 'load-path "/.emacs.d/plugins/ibus")
(require 'ibus) 

;; open files by default read only mode
(defun make-some-files-read-only ()
  "when file opened is of a certain mode, make it read only"
  (when (memq major-mode '(c++-mode emacs-lisp-mode text-mode python-mode
                                    ruby-mode c-mode))
    (toggle-read-only 1)))

(add-hook 'find-file-hooks 'make-some-files-read-only)
(add-hook 'after-init-hook 'ibus-mode-on) 

;; toggle full Screen
;; only available in ubuntu 
(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                           nil 'fullboth)))
(global-set-key [(meta return)] 'toggle-fullscreen)

;; bookmark plus
(add-to-list 'load-path "~/.emacs.d/plugins/bookmark+")
(require 'bookmark+)
(setq bmkp-auto-light-when-set 'Any bookmark)
(global-set-key [(control f2)] 'bookmark-set)
(global-set-key [f2] 'bmkp-next-bookmark-this-file/buffer-repeat)

;; folding code
(load-library "hideshow")
(add-hook 'python-mode-hook (lambda () (hs-minor-mode 1)))
(global-set-key (kbd "C--") 'hs-hide-all)
(global-set-key (kbd "C-=") 'hs-show-all)
(global-set-key (kbd "C-+") 'hs-toggle-hiding)

;; copy line function
(defun copy-line(&optional arg)
(interactive "p")
(kill-line arg)
(yank))
(global-set-key (kbd "C-;") 'copy-line)

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
;; tramp
(require 'tramp)

;; Tabbar
(add-to-list 'load-path "~/.emacs.d/plugins/tabbar")
(require 'tabbar)
(tabbar-mode t)
;;;; 设置tabbar外观
;; 设置默认主题: 字体, 背景和前景颜色，大小
(set-face-attribute 'tabbar-default nil
                    :family "Vera Sans YuanTi Mono"
                    :background "gray80"
                    :foreground "gray30"
                    :height 1.0)
;; 设置左边按钮外观：外框框边大小和颜色
(set-face-attribute 'tabbar-button nil
                    :inherit 'tabbar-default
                    :box '(:line-width 1 :color "gray30"))
;; 设置当前tab外观：颜色，字体，外框大小和颜色
(set-face-attribute 'tabbar-selected nil
                    :inherit 'tabbar-default
                    :foreground "DarkGreen"
                    :background "LightGoldenrod"
                    :box '(:line-width 2 :color "DarkGoldenrod")
                    ;; :overline "black"
                    ;; :underline "black"
                    :weight 'bold)
;; 设置非当前tab外观：外框大小和颜色
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


;; set the default text coding system(write)
(setq default-buffer-file-coding-system 'utf-8)

;; set the default text coding system(read)
;; (prefer-coding-system 'utf-8)



(setq-default kill-whole-line t)
(setq kill-ring-max 50)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq frame-title-format "emacs@%b %f")
;; 高亮显示选中区域
(transient-mark-mode t)
;; Disable backup and autosave
(setq-default make-backup-files nil)
(setq column-number-mode t)
(setq line-number-mode t)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(display-time)

(global-set-key [f1] 'cua-mode)
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
