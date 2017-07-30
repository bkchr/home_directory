(setq-default neo-vc-integration (quote (face)))
(setq-default neo-autorefresh t)

;; Refresh neotree after switching the buffer
(add-hook 'switch-buffer-functions
          (lambda (prev cur)
            (when (neo-global--window-exists-p)
              (neotree-refresh t))))
