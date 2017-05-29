(setq TeX-source-correlate-mode t)
(setq TeX-source-correlate-start-server t)
(setq TeX-source-correlate-method 'synctex)
(setq TeX-view-program-list
      '(("Okular" "okular --unique %o")
        ("Skim" "displayline -b -g %n %o %b")))

(cond
 ((string-equal system-type "darwin")
  (progn (setq TeX-view-program-selection '((output-pdf "Skim")))))
 ((string-equal system-type "gnu/linux")
  (progn (setq TeX-view-program-selection '((output-pdf "Okular"))))))

