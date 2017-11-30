(frame-parameter nil 'environment)

;; Do not paste the highlighted text when it should be replaced
;(setq save-interprogram-paste-before-kill
;      t)

(defun my-save-if-bufferfilename ()
  (if (buffer-file-name)
      (progn
        (save-buffer))))

;; save on leaving evil mode
(add-hook 'evil-insert-state-exit-hook 'my-save-if-bufferfilename)

;; don't yell at me about tags
(setq large-file-warning-threshold nil)
(setq dotspacemacs-large-file-size 9999999)

;;(setq-default js-indent-level 2)
;;(setq-default js2-basic-offset 2)
;;(setq-default js3-indent-level 2)
;;(setq tab-width 4)

(require 'direnv)
(direnv-mode)

(setq-default whitespace-style '(face tabs spaces lines-trail))
