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
