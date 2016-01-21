#!/usr/bin/env emacs --script
;; Emacs script for exporting all org files in current directory to pdf
;; using LaTeX and beamer.
;
;; Author: Sam Sinayoko, Hans Fangohr, 27/12/2015
;; Email: s.sinayoko@soton.ac.uk
;; Date: 05/10/2014

(require 'ox-latex)

;; Define an interactive function for easy testing
(defun org-beamer-export-to-pdf-directory (dirname)
  "Export all org files in directory `dirname' to pdf"
  (interactive "DExport org files to pdf in directory:")
  (save-excursion
    (let ((org-files-lst ))
      (dolist (org-file (directory-files dirname nil "\.org$"))
	(message "*** Exporting file %s ***" org-file)
	(find-file org-file)
	(org-latex-export-to-latex)
	(kill-buffer)))))

;; Make the code blocks look nicer
(add-to-list 'org-latex-packages-alist '("" "minted"))
(add-to-list 'org-latex-packages-alist '("" "fancyvrb"))
(setq org-latex-listings 'minted)
(setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
	"pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
	"pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
(setq org-latex-minted-options
      '(("bgcolor" "white") ("frame" "lines")))

;; Make the results block look nicer with package fancyvrb
;; The package fancyvrb must be included in the org-file header
(defun org-latex-filter-fancyvrb (text backend info)
      "Convert begin/end{verbatim} to begin/end{Verbatim}.
    Allows use of the fancyvrb latex package."
      (when (or (org-export-derived-backend-p backend 'beamer)
                (org-export-derived-backend-p backend 'latex))
        (replace-regexp-in-string
         "\\\\\\(begin\\|end\\){verbatim}"
         "\\\\\\1{Verbatim}"
         text)))

(add-to-list 'org-export-filter-final-output-functions
	     'org-latex-filter-fancyvrb)


;; Use utf8x for LaTeX export to access more unicode characters
(setq org-latex-inputenc-alist '(("utf8" . "utf8x")))

;; Export all org files
(org-beamer-export-to-pdf-directory ".")
