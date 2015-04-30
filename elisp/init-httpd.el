(require-package 'simple-httpd)

(require 'simple-httpd)
(setq httpd-root "/Users/john/www")
(setq httpd-port 8888)
(httpd-start)

(provide 'init-httpd)
