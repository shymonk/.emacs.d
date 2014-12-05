
;; Mac config
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; Global key-bind
(global-set-key [f3] 'toggle-read-only)
(global-set-key [f4] 'kill-this-buffer)

(global-set-key [f6] 'replace-string)
(global-set-key [f9] 'list-bookmarks)
(global-set-key [(shift f9)] 'bookmark-set)

(global-set-key [f10] 'python-shell)
(global-set-key [f11] 'term)
(global-set-key [f12] 'save-buffer);

(global-set-key [(meta ?/)] 'hippie-expand)

(provide 'init-binding)
