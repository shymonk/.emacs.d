;; Projectile
(require-package 'projectile)

(setq projectile-switch-project-action 'neotree-projectile-action)
(setq projectile-enable-caching t)
(projectile-global-mode)

(provide 'init-project)

