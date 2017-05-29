(setq neo-vc-integration (quote (face)))

(defun my-neo-buffer--refresh (save-pos-p &optional non-neotree-buffer)
  "Refresh the NeoTree buffer.
If SAVE-POS-P is non-nil, it will be auto save current line number."
  (let ((start-node neo-buffer--start-node))
    (unless start-node
      (setq start-node default-directory))
    (neo-buffer--with-editing-buffer
     ;; save context (when save-pos-p (neo-buffer--save-cursor-pos)
     (when non-neotree-buffer
       (setq neo-buffer--start-node start-node))
     ;; starting refresh
     (erase-buffer)
     (neo-buffer--node-list-clear)
     (neo-buffer--insert-banner)
     (setq neo-buffer--start-line neo-header-height)
     (neo-buffer--insert-tree start-node 1))))

(defun my-neo-global--open-and-find (path fullpath)
  "Quick select node which specified PATH in NeoTree."
  (let ((npath path) root-dir)
    (when (null npath)
      (throw 'invalid-path "Invalid path to select."))
    (setq root-dir (if (file-directory-p npath)
                       npath
                     (neo-path--updir npath)))
    (when (or (not (neo-global--window-exists-p))
              (not (neo-global--file-in-root-p npath)))
      (neo-global--with-buffer (setq start-path (expand-file-name (substitute-in-file-name path)))
                               (setq neo-buffer--start-node start-path)
                               (my-neo-buffer--refresh nil))
      (neo-global--with-window (neo-buffer--select-file-node fullpath t)))))

(defun my-neotree-find (path fullpath)
  "Quick select node which specified PATH in NeoTree.
If path is nil and no buffer file name, then use DEFAULT-PATH,"
  (when (neo-global--window-exists-p)
    (my-neo-global--open-and-find path fullpath)
    (when neo-auto-indent-point
      (neo-point-auto-indent))))

(defun jj-neotree-find (newbuffer)
  (interactive)
  (catch 'return
    (when (buffer-file-name)
      (setq buff-path (file-name-directory (buffer-file-name)))
      (when buff-path
        (setq npath (ignore-errors (projectile-project-root)))
        (when npath
          (my-neotree-find npath
                           (buffer-file-name)))))))

(add-hook 'switch-buffer-functions
          (lambda (prev cur)
            (jj-neotree-find cur)))
