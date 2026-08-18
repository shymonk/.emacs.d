;; markdown-mode

(require-package 'markdown-mode)

(autoload 'gfm-mode "markdown-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(custom-set-variables '(markdown-command "/usr/local/bin/markdown"))

;; Make windmove work in markdown-mode
(add-hook 'gfm-mode-hook
      (lambda ()
        (local-unset-key (kbd "M-<left>"))
        (local-unset-key (kbd "M-<right>"))
        (local-unset-key (kbd "M-<up>"))
        (local-unset-key (kbd "M-<down>"))))


(add-hook 'gfm-mode-hook
          '(lambda () (visual-line-mode)))


(require-package 'impatient-mode)
(require 'json)

(defun spike-leung/imp-markdown-filter (buffer)
  "Define imp markdown filter.
Wrap BUFFER with HTML, render with https://github.com/markedjs/marked and style with https://github.com/sindresorhus/github-markdown-css."
  (princ
   (with-current-buffer buffer
     (format "<!DOCTYPE html>
<html>
  <head>
    <title>Markdown Preview</title>
    <link
      rel=\"stylesheet\"
      href=\"https://cdnjs.cloudflare.com/ajax/libs/github-markdown-css/5.8.1/github-markdown.min.css\"
      integrity=\"sha512-BrOPA520KmDMqieeM7XFe6a3u3Sb3F1JBaQnrIAmWg3EYrciJ+Qqe6ZcKCdfPv26rGcgTrJnZ/IdQEct8h3Zhw==\"
      crossorigin=\"anonymous\"
      referrerpolicy=\"no-referrer\"
    />
    <style>
      .markdown-body {
        box-sizing: border-box;
        min-width: 200px;
        max-width: 980px;
        margin: 0 auto;
        padding: 45px;
      }

      @media (max-width: 767px) {
        .markdown-body {
          padding: 15px;
        }
      }
    </style>
    <script src=\"https://cdn.jsdelivr.net/npm/marked/marked.min.js\"></script>
  </head>
  <body>
    <div id=\"markdown-body\" class=\"markdown-body\"></div>
    <script>
      document.getElementById('markdown-body').innerHTML = marked.parse(%s);
    </script>
  </body>
</html>"
             (json-encode
              (buffer-substring-no-properties (point-min) (point-max)))))
   (current-buffer)))

(defun markdown-preview ()
  "Live preview markdown."
  (interactive)
  (impatient-mode)
  (imp-visit-buffer)
  (imp-set-user-filter 'spike-leung/imp-markdown-filter))

(defun spike-leung/disable-preview-markdown ()
  "Disable markdown preview."
  (interactive)
  (impatient-mode -1)
  (imp-remove-user-filter))


(provide 'init-markdown)
