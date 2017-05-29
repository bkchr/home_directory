;;; c++ mode settings
;;; http://stackoverflow.com/a/663636/1531656
;;; http://stackoverflow.com/a/22711444/1531656
(defun my-c++-c-mode-hook ()
  (google-set-c-style)
  (if (string-suffix-p "hpp" buffer-file-name)
      (progn (c-set-offset 'innamespace 2))
      (progn (c-set-offset 'innamespace 0))))

;;(dolist (mode '(c-mode-hook c++-mode-hook))
;;  (add-hook mode 'google-set-c-style))

(dolist (mode '(c-mode-hook c++-mode-hook))
  (add-hook mode 'my-c++-c-mode-hook))

(dolist (mode '(c-mode-hook c++-mode-hook))
  (add-hook mode 'google-make-newline-indent))

(add-to-list 'auto-mode-alist '("\\.cl\\'" . c-mode))

(setq company-idle-delay 0)
;(define-key c-mode-map [(tab)] 'company-complete)
;(define-key c++-mode-map [(tab)] 'company-complete)

(require 'semantic/bovine/gcc)
(setq cmake-ide-flags-c++ (append '("-std=c++11")
                           (mapcar (lambda (path) (concat "-I" path)) (semantic-gcc-get-include-paths "c++"))))
(setq cmake-ide-flags-c (append (mapcar (lambda (path) (concat "-I" path)) (semantic-gcc-get-include-paths "c"))))

(require 'whitespace)
(setq whitespace-line-column 80)
(setq whitespace-style '(face lines-tail))
(add-hook 'c++-mode-hook 'whitespace-mode)
(add-hook 'c-mode-hook 'whitespace-mode)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(require 'semantic)

(dolist (mode '(c-mode-hook c++-mode-hook))
  (add-hook mode 'semantic-mode))

(dolist (mode '(c-mode-hook c++-mode-hook))
  (add-hook mode 'spacemacs/lazy-load-srefactor))

(require 'stickyfunc-enhance)
(dolist (mode '(c-mode-hook c++-mode-hook))
  (add-hook mode 'spacemacs/lazy-load-stickyfunc-enhance))

(setq ycmd-server-command '("python" "/home/bastian/projects/ycmd/ycmd"))

(setq ycmd-extra-conf-whitelist '("~/projects/*"))
(setq ycmd-force-semantic-completion t)

(add-to-list 'ycmd-parse-conditions 'new-line)

(add-hook 'c++-mode-hook 'ycmd-mode)
