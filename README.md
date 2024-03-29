[![Build Status](https://travis-ci.org/fangohr/template-latex-paper-from-orgmode.svg?branch=master)](https://travis-ci.org/fangohr/template-latex-paper-from-orgmode)

# Template for writing LaTeX documents from Emacs orgmode

A set of (mostly) self-explaining files for using orgmode to author structure and content of a document, and then insert this into a latex template. Use cases are where the latex style, class, and detailed commands to be used are prescribed by the journal/publisher etc.

Requirements: A recent Emacs (tested on Emacs 24.5, and 28.2), Python, make, pdflatex.

## Get started

- clone this repository
- change into the ``paper`` subdirectory
- call ``make``

## What does the final ``paper.pdf`` look like?

We have committed this file for convenience to the repository, and it can be seen [here](compiled-paper.pdf).

Author: Hans Fangohr, University of Southampton, European XFEL

## Update 2018

Note the contribution that shows a one-file solution for this problem at https://github.com/fangohr/template-latex-paper-from-orgmode/issues/4 by @dineshadepu .

## Update 2023

- added target `make watch` to automatically recompile on change of sources
