;; show only one star for headlines
(setq org-hide-leading-stars 'hidestars)

;; enter follows links
(setq org-return-follows-link t)

(setq org-directory "~/projects/org/")

(progn
  (setq org-capture-templates
        '(("t" "Task" entry (file+headline "~/projects/org/documents/gtd.org" "Inbox")
           "* TODO %?")
          ("n" "note" entry (file org-default-notes-file) "* %? :NOTE:\n%U\n%a\n" "~/projects/org/documents/gtd.org" "Notes")
          )))

;; Use IDO for target completion
(setq org-completion-use-ido t)
;; Targets include this file and any file contributing to the agenda - up to 5 levels deep
(setq org-refile-targets (quote ((org-agenda-files :maxlevel . 5) (nil :maxlevel . 5))))
;; Targets start with the file name - allows creating level 1 tasks
(setq org-refile-use-outline-path (quote file))
;; Targets complete in steps so we start with filename, TAB shows the next level of targets etc
(setq org-outline-path-complete-in-steps nil)

;; support the folding of entries
(setq org-drawers (quote ("PROPERTIES" "CLOCKTABLE" "LOGBOOK" "CLOCK")))

;; "!" is a timestamp
;; "@" is a notice
(setq org-todo-keywords
      '((sequence "TODO(t)" "STARTED(s!)" "WAITING(w@/!)" "APPT(a)" "PROJ(p)" 
                  "DELEGATED(g@/!)" "|" "DONE(d!)" "ZKTO(z)" "CANCELED(c@)")))

;; Customize the colors
(setq org-todo-keyword-faces
      '(("TODO"  . (:foreground "#b70101" :weight bold))
        ("STARTED"  . (:foreground "#b70101" :weight bold))
        ("APPT"  . (:foreground "sienna" :weight bold))
        ("PROJ"  . (:foreground "blue" :weight bold))
        ("ZKTO"  . (:foreground "orange" :weight bold))
        ("WAITING"  . (:foreground "orange" :weight bold))
        ("DONE"  . (:foreground "forestgreen" :weight bold))
        ("DELEGATED"  . (:foreground "forestgreen" :weight bold))
        ("CANCELED"  . shadow)))

;; Fast TODO Selection
(setq org-use-fast-todo-selection t)

;; Einen Zeitstempel eintragen, wenn eine Aufgabe als erledigt markiert wird
(setq org-log-done 'time)

;; Einen eigenen Drawer benutzen
(setq org-log-into-drawer t)

;; Aktuelle Zeile in der Agenda hervorheben
(add-hook 'org-agenda-mode-hook '(lambda () (hl-line-mode 1 )))

(setq org-agenda-format-date 
      "%d-%m-%Y ---------------------------------------------------------------------")

;; Tasks mit Prioriäten unterschiedlich darstellen:
(setq org-agenda-fontify-priorities 
      (quote ((65 (:foreground "Red")) (66 (:foreground "Blue")) (67 (:foreground "Darkgreen")))))

(setq org-agenda-date-weekend (quote (:foreground "Yellow" :weight bold)))

;; Tasks mit Datum in der Agenda ausblenden, wenn sie bereits erledigt sind:
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-skip-scheduled-if-done t)

(setq org-agenda-filter-preset '("-someday"))

(setq org-agenda-span 1)

;; Eigene Agenda-Views
(setq org-agenda-custom-commands
      (quote (
              ("s" "SOMEDAY" tags "someday" ((org-agenda-filter-preset 
                                              '("+someday"))(org-agenda-todo-ignore-with-date nil)))
              ("z" todo "ZKTO")
              ("f" "Agenda and flagged tasks"
               ((tags "zkto")
                (tags "flagged")
                (agenda ""))))))

(setq org-agenda-files (quote("~/projects/org/documents/"
                              "~/projects/org/documents/notes/"
                              "~/projects/org/documents/journal/")))

;; Save clock data and notes in a separate drawer
(setq org-clock-into-drawer "CLOCK")


;; Resume clocking tasks when emacs is restarted
(org-clock-persistence-insinuate)

;; Yes it's long... but more is better ;)
(setq org-clock-history-length 35)

;; Resume clocking task on clock-in if the clock is open
(setq org-clock-in-resume t)

;; Change task state to STARTED when clocking in
                                        ;(setq org-clock-in-switch-to-state "STARTED")

;; Sometimes I change tasks I'm clocking quickly 
;; this removes clocked tasks with 0:00 duration
;;(setq org-clock-out-remove-zero-time-clocks t)

;; Don't clock out when moving task to a done state
(setq org-clock-out-when-done nil)

;; Save the running clock and all clock history when exiting Emacs, 
;; load it on startup
(setq org-clock-persist t)

;; Disable auto clock resolution
(setq org-clock-auto-clock-resolution nil)

(setq org-global-properties (quote (("Effort_ALL" . 
                                     "0:10 0:30 1:00 2:00 3:00 4:00 5:00 6:00 8:00"))))

;; Agenda direkt mit dem jeweiligen Clock-Report starten:
(setq org-agenda-start-with-clockreport-mode t)

;; Keine Links, maximal bis Level 4 herunter:
(setq org-agenda-clockreport-parameter-plist (quote (:link t :maxlevel 4)))

(with-eval-after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (sh . t)
     (python . t)
     (octave . t)
     (sqlite . t)
     (perl . t)
     (C . t)
     ))
  )

(setq org-refile-targets '((nil :maxlevel . 9)
                           (org-agenda-files :maxlevel . 9)))
(setq org-outline-path-complete-in-steps nil)         ; Refile in a single go
(setq org-refile-use-outline-path t)                  ; Show full paths for refiling
