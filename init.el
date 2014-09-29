;; emacs settings
;; hellojohn201@gmail.com

:(defconst *is-a-mac* (eq system-type 'darwin))

;;----------------------------------------------------------------------------
;; Initialize load-path by "~/.emacs.d/elisp"
;;----------------------------------------------------------------------------

(add-to-list 'load-path (expand-file-name "elisp" user-emacs-directory))


;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------

(require 'init-elpa)
(require 'init-exec-path)

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------

(require 'init-filetree)
(require 'init-dash)
(require 'init-ido)
(require 'init-fiplr)
(require 'init-etags)
(require 'init-ibuffer)
(require 'init-bookmark)
(require 'init-git)
(require 'init-hideshow)
;; (require 'init-unicode)
(require 'init-linum)
(require 'init-highlight)
(require 'init-cscope)
(require 'init-tabbar)
(require 'init-auto-complete)
(require 'init-visual-regexp)
(require 'init-flymake)
(require 'init-dired)

(require 'init-ssh)
(require 'init-shell)
(require 'init-org)
(require 'init-theme)
(require 'init-window)

(require 'init-markdown)
(require 'init-webmode)
(require 'init-python)

(require 'init-search)
(require 'init-editing-utils)
(require 'init-binding)
(require 'init-misc)



;; config for *nix and windows platform

(setq inhibit-startup-message t)
(mouse-avoidance-mode 'animate)
(setq default-major-mode 'text-mode)
(icomplete-mode t)
(show-paren-mode t)
(setq show-paren-style 'parentheses)
(global-font-lock-mode t)
(setq x-select-enable-clipboard t)
(setq toggle-read-only t)
(setq default-buffer-file-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; set the default text coding system(read)
(prefer-coding-system 'utf-8)
(set-default 'truncate-lines t)
(setq-default kill-whole-line t)
(setq kill-ring-max 50)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq frame-title-format "%f")
(transient-mark-mode t)
(setq-default make-backup-files nil)
(setq column-number-mode t)
(setq line-number-mode t)
(setq display-time-24hr-format t)
(display-time)

(if window-system
    (set-fontset-font t 'gb18030' ("Hei" . "unicode-bmp")))

(global-auto-revert-mode)
(setq default-directory "~/Workspace/")
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
(setq c-basic-offset 4)
(add-hook 'html-mode-hook (lambda () (setq sgml-basic-offset 4)))
(add-hook 'python-mode-hook(lambda () (setq tab-width 4) (setq python-indent 4)))


;; Yasnippet
;; (add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
;; (require 'yasnippet)
;; (yas/global-mode 1)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bmkp-last-as-first-bookmark-file "/Users/john/.emacs.d/bookmarks")
 '(column-number-mode t)
 '(current-language-environment "UTF-8")
 '(cursor-type (quote bar) t)
 '(custom-enabled-themes (quote (sanityinc-solarized-dark)))
 '(custom-safe-themes (quote ("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(display-time-mode t)
 '(global-hl-line-mode t)
 '(scroll-bar-mode (quote right))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 150 :width normal :foundry "apple" :family "Monaco")))))
