;; AUCTeX configuration

(load "auctex.el" nil t t)

(setq TeX-auto-save t)
(setq TeX-parse-self t)

;; use pdflatex
(setq TeX-PDF-mode nil)
;(setq preview-gs-command "/usr/bin/gs")

;; use evince for dvi and zathura pdf viewer
;; evince-dvi backend should be installed
(setq TeX-view-program-selection
      '((output-dvi "DVI Viewer")
        (output-pdf "PDF Viewer")))
(setq TeX-view-program-list
      '(("DVI Viewer" "evince %o")
        ("PDF Viewer" "zathura %o")))

(setq LaTeX-math-abbrev-prefix "'")

; All master files called "master".
(setq-default TeX-master "master")

;(set-default 'preview-default-document-pt 10)
(set-default 'preview-scale-function 1)
