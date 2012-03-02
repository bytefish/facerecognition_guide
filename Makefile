python:
	echo "\def\python{}" > definitions.tex
	pdflatex facerec.tex
	bibtex facerec.aux
	pdflatex facerec.tex
	pdflatex facerec.tex
	mv facerec.pdf facerec_python.pdf
	make clean
	
octave:
	echo "%\def\python{}" > definitions.tex
	pdflatex facerec.tex
	bibtex facerec.aux
	pdflatex facerec.tex
	pdflatex facerec.tex
	mv facerec.pdf facerec_octave.pdf
	make clean

clean:
	rm *.log
	rm *.bbl
	rm *.out
	rm *.blg
	rm *.aux
	rm *.toc
