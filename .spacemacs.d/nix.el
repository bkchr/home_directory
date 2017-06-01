(load "/run/current-system/sw/share/emacs/site-lisp/nix-mode.el")
(require 'nix-mode)

;;(setq flycheck-command-wrapper-function
;;      (lambda (command) (apply 'nix-shell-command (nix-current-sandbox) command))
;;      flycheck-executable-find
;;      (lambda (cmd) (nix-executable-find (nix-current-sandbox) cmd)))

;;(add-hook 'rust-mode-hook (lambda () (message "Test")
;;                            (setq cargo-process--custom-path-to-bin (file-name-directory (executable-find "cargo")))))

;;(add-hook 'rust-mode-hook (lambda ()
;;                            (setq rust-rustfmt-bin (executable-find "rustfmt"))))
