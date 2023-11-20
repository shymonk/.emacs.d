;; For GNU Emacs
;; C-x C-f /remotehost:filename  RET (or /method:user@remotehost:filename)
;; For XEmacs use the syntax
;; C-x C-f /[method/user@remotehost]/filename
;; You can also edit local files as root with either of the following (note the double colon, which is required)
;; C-x C-f /su::/etc/hosts
;; C-x C-f /sudo::/etc/hosts

(require 'tramp)
(setq tramp-default-method "ssh")
(setq tramp-verbose 10)
(setq tramp-terminal-type "tramp") 

(provide 'init-ssh)
