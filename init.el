;;;; shymonk's .emacs file
; Fri Jul 31 2015


;;;; The Help Key
; Control-h is the help key;
; after typing control-h, type a letter to
; indicate the subject about which you want help.
; For an explanation of the help facility,
; type control-h two times in a row.



;;----------------------------------------------------------------------------
;; Initialize package management
;;----------------------------------------------------------------------------
(require 'package)
(setq package-archives '(("gnu"   . "http://mirrors.cloud.tencent.com/elpa/gnu/")
                         ("melpa" . "http://mirrors.cloud.tencent.com/elpa/melpa/")))
(package-initialize)
(eval-when-compile
  (require 'use-package))



(defconst *is-a-mac* (eq system-type 'darwin))
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

;; (require 'init-dash)
(require 'init-ido)
(require 'init-ibuffer)
;; (require 'init-bookmark)
(require 'init-git)
;; (require 'init-unicode)
(require 'init-linum)
;;(require 'init-highlight)
(require 'init-cscope)
(require 'init-yasnippet)
(require 'init-auto-complete)
(require 'init-visual-regexp)
;; (require 'init-flymake)
;; (require 'init-dired)
;; (require 'init-wget)
(require 'init-project)

(require 'init-ssh)
(require 'init-shell)
(require 'init-org)
;; (require 'init-theme)
(require 'init-gui-frames)

(require 'init-image)
(require 'init-json)
(require 'init-markdown)
(require 'init-js)
;; (require 'init-yaml)
;; (require 'init-webmode)
;; (require 'init-python)
;; (require 'init-go)
;; (require 'init-lua)
;; (require 'init-httpd)

(require 'init-search)
;; (require 'init-editing-utils)
(require 'init-binding)
(require 'init-window)
(require 'init-protobuf)
(require 'init-misc)



;; config for *nix and windows platform

(setq inhibit-startup-message t)
(setq debug-on-error t)
;; (setq debug-ignored-errors nil)
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
(setq paradox-github-token "9740991da1cd7b31e49b612403ffcc0a7c0c4cb8")

(setq column-number-mode t)
(setq line-number-mode t)

(setq display-time-24hr-format t)
(display-time)

(if window-system
  (setq global-hl-line-mode t)
  )
;;(set-fontset-font "fontset-default" 'han '("STHeiti"))

(global-auto-revert-mode)
(setq default-directory "~/workspace/meituan/")
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
(setq c-basic-offset 4)
(add-hook 'html-mode-hook (lambda () (setq sgml-basic-offset 4)))
(add-hook 'python-mode-hook(lambda () (setq tab-width 4) (setq python-indent 4)))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(current-language-environment "UTF-8")
 '(cursor-type 'bar)
 '(custom-enabled-themes '(sanityinc-solarized-dark))
 '(custom-safe-themes
   '("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default))
 '(display-time-mode t)
 '(package-selected-packages
   '(treemacs-projectile treemacs use-package counsel go-tag godoctor markdown-mode markdown-mode+ company-go company go-autocomplete go-add-tags go-eldoc dockerfile-mode yasnippet xcscope wget web-mode web-beautify visual-regexp virtualenvwrapper tabbar sr-speedbar simple-httpd scala-mode sass-mode python-mode powerline paradox org nlinum neotree nav multiple-cursors magit lua-mode json-mode jedi highlight-symbol git-timemachine git-rebase-mode git-gutter git-commit-mode frame-restore flymake-python-pyflakes fiplr f expand-region exec-path-from-shell edit-server direx bookmark+ bm ag))
 '(paradox-automatically-star t)
 '(safe-local-variable-values
   '((encoding . utf-8)
     (project-venv-name . "bee")
     (project-venv-name . "wcms")))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 150 :width normal :foundry "apple" :family "Monaco"))))
 '(web-mode-block-control-face ((t (:inherit web-mode-preprocessor-face))))
 '(web-mode-block-delimiter-face ((t (:inherit web-mode-block-control-face))))
 '(web-mode-css-selector-face ((t (:inherit font-lock-function-name-face))))
 '(web-mode-html-attr-name-face ((t (:inherit font-lock-variable-name-face))))
 '(web-mode-html-tag-face ((t (:inherit font-lock-function-name-face))))
 '(web-mode-preprocessor-face ((t (:inherit web-mode-keyword-face))))
 '(web-mode-variable-name-face ((t (:inherit font-lock-reference-face)))))
(put 'erase-buffer 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
