
paper.pdf: paper.tex content.tex paper.bib
	latexmk --pdflatex -shell-escape paper.tex

force: content.tex
	pdflatex -shell-escape paper.tex
	bibtex paper
	pdflatex -shell-escape paper.tex
	pdflatex -shell-escape paper.tex


content.tex: content.org extract_body.py code/*
	@# Note: this target is used by latexmk (see latexmkrc)
	# Export file to LaTeX
	emacs --script ./org-files-to-tex.el *.org
	# Rename so that filename starts with underscore
	mv content.tex _content.tex
	# Extract body and save result to the original filename
	python extract_body.py _content.tex content.tex
	# Remove temporary file
	rm _content.tex

clean:
	rm -f paper.aux paper.bbl paper.blg paper.log paper.out paper.pdf
	rm -f _content.tex content.tex todo.tex
	rm -rf _minted-paper/

update-compiled-paper.pdf:
	make force
	cp paper.pdf ../compiled-paper.pdf

watch:
	@# use this to re-run automatically if sources.
	@# note the latexmkrc file to define the dependency on org files.
	latexmk --pdflatex -shell-escape -pvc -view=none paper.tex

# skim is pdf viewer that updates automatically when the pdf file changes
view:
	open -a skim paper.pdf
