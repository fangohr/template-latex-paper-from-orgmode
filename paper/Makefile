
paper.pdf: paper.tex _content.tex paper.bib
	pdflatex -shell-escape paper.tex
	bibtex paper
	pdflatex -shell-escape paper.tex
	pdflatex -shell-escape paper.tex

force: _content.tex
	pdflatex -shell-escape paper.tex
	bibtex paper
	pdflatex -shell-escape paper.tex
	pdflatex -shell-escape paper.tex

_content.tex: content.org extract_body.py code/*
	emacs --script ./org-files-to-tex.el
	python extract_body.py content.tex _content.tex

clean:
	rm -f paper.aux paper.bbl paper.blg paper.log paper.out paper.pdf
	rm -f _content.tex content.tex todo.tex
	rm -rf _minted-paper/

update-compiled-paper.pdf:
	make force
	cp paper.pdf ../compiled-paper.pdf
