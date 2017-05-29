(push "~/.spacemacs.d/plugins/writegood-mode/" load-path)
(require 'writegood-mode)
(global-set-key "\C-cg" 'writegood-mode)
(global-set-key "\C-c\C-gg" 'writegood-grade-level)
(global-set-key "\C-c\C-ge" 'writegood-reading-ease)

