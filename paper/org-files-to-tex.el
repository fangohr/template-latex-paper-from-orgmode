#!/usr/bin/env emacs --script
;; Emacs script for exporting all org files in current directory to pdf
;; using LaTeX and beamer.
;
;; Author: Sam Sinayoko, Hans Fangohr, 27/12/2015
;; Email: s.sinayoko@soton.ac.uk
;; Date: 05/10/2014

(require 'ox-latex)

;; Define an interactive function for easy testing
(defun org-beamer-export-to-pdf-directory (files)
  "Export all files to latex"
  (interactive "Export org files to tex")
  (save-excursion
    (let ((org-files-lst ))
      (dolist (org-file files)
        (message "*** Exporting file %s ***" org-file)
        (find-file org-file)
        (org-latex-export-to-latex)
        (kill-buffer)))))

;;;; Make the code blocks look nicer
;;(add-to-list 'org-latex-packages-alist '("" "minted"))
;;(add-to-list 'org-latex-packages-alist '("" "fancyvrb"))
;;(setq org-latex-listings 'minted)
;;(setq org-latex-pdf-process
;;      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
;;	"pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
;;	"pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
;;(setq org-latex-minted-options
;;      '(("bgcolor" "white") ("frame" "lines")))
;;
;;;; Make the results block look nicer with package fancyvrb
;;;; The package fancyvrb must be included in the org-file header
;;(defun org-latex-filter-fancyvrb (text backend info)
;;      "Convert begin/end{verbatim} to begin/end{Verbatim}.
;;    Allows use of the fancyvrb latex package."
;;      (when (or (org-export-derived-backend-p backend 'beamer)
;;                (org-export-derived-backend-p backend 'latex))
;;        (replace-regexp-in-string
;;         "\\\\\\(begin\\|end\\){verbatim}"
;;         "\\\\\\1{Verbatim}"
;;         text)))
;;
;;(add-to-list 'org-export-filter-final-output-functions
;;	     'org-latex-filter-fancyvrb)


;; the next section allows to add :ignoreheading: to section headers,
;; and the heading will be removed in the latex output, but the section
;; itself be included.
;;
;; This is useful to 'label' paragraphs or sections to draft a document
;; while not wanting to reveal that label/title in the final version to the
;; reader.
(defun sa-ignore-headline (contents backend info)
  "Ignore headlines with tag `ignoreheading'."
  (when (and (org-export-derived-backend-p backend 'latex 'html 'ascii)
             (string-match "\\(\\`.*\\)ignoreheading\\(.*\n\\)"
                           (downcase contents)))
                                        ;(replace-match "\\1\\2" nil nil contents)  ;; remove only the tag ":ignoreheading:" but keep the rest of the headline
    (replace-match "" nil nil contents)        ;; remove entire headline
    ))
(add-to-list 'org-export-filter-headline-functions 'sa-ignore-headline)

;; Use utf8x for LaTeX export to access more unicode characters
(setq org-latex-inputenc-alist '(("utf8" . "utf8x")))

;; Export all org files given on the command line
(org-beamer-export-to-pdf-directory argv)
