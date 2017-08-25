(defun my-lsp-mode-hook ()
  (direnv-update-environment default-directory)(lsp-mode))

(setq-default rustrls-lsp-mode-hook 'my-lsp-mode-hook)

(defun my-rust-column-length ()
  (setq-default fci-rule-column 100))

(add-hook 'rust-mode-hook 'my-rust-column-length)

(spacemacs/add-to-hooks 'turn-on-fci-mode
                        '(rust-mode-hook))

(add-to-list 'load-path "~/.spacemacs.d/plugins/rust-snippets")
(autoload 'rust-snippets/initialize "rust-snippets")
(eval-after-load 'yasnippet
  '(rust-snippets/initialize))

(setq-default racer-rust-src-path nil)

;(add-to-list 'grep-find-ignored-files "*.rlib")
