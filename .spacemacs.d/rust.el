(add-to-list 'load-path "/home/bastian/.spacemacs.d/plugins/lsp-rust")
(add-to-list 'load-path "/home/bastian/.spacemacs.d/plugins/lsp-mode")

(require 'lsp-rust)
(require 'lsp-mode)
(require 'lsp-flycheck)

(defun my-lsp-mode-hook ()
  (direnv-update-environment default-directory)(lsp-mode))

(add-hook 'rust-mode-hook 'my-lsp-mode-hook)

;;(add-hook 'rust-mode-hook 'ycmd-mode)
(defun my-rust-column-length ()
  (setq-default fci-rule-column 100))

;; save on leaving evil mode
(add-hook 'rust-mode-hook 'my-rust-column-length)

(spacemacs/add-to-hooks 'turn-on-fci-mode
                        '(rust-mode-hook))

(add-to-list 'load-path "~/.spacemacs.d/plugins/rust-snippets")
(autoload 'rust-snippets/initialize "rust-snippets")
(eval-after-load 'yasnippet
  '(rust-snippets/initialize))

(setq-default racer-rust-src-path nil)
