(global-company-mode t)

(define-key rust-mode-map [(tab)] 'company-complete)

(setq company-idle-delay 0.03)
;(setq company-minimum-prefix-length 1)
(setq company-require-match 'nil)

(setq ac-auto-show-menu 0.05)
(setq ac-delay 0.05)
(setq ac-menu-height 20)
