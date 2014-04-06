TEX = pdflatex -interaction nonstopmode
BIB = bibtex
GS = gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite

FILE = LeeperCV
JOB = LeeperCV_build

all: resume cv

spell:
	ispell *.tex

clean:
	rm -fv *.aux *.log *.bbl *.blg *.toc *.out *.lot *.lof  Leeper*.pdf

resume:
	$(TEX) -jobname=$(JOB)  "\newcommand\ResumeCV{0}\input{$(FILE).tex}"
	$(TEX) -jobname=$(JOB)  "\newcommand\ResumeCV{0}\input{$(FILE).tex}"
	mv $(JOB).pdf LeeperResume.pdf

cv:
	$(TEX) -jobname=$(JOB)  "\newcommand\ResumeCV{1}\input{$(FILE).tex}"
	$(TEX) -jobname=$(JOB)  "\newcommand\ResumeCV{1}\input{$(FILE).tex}"
	mv $(JOB).pdf LeeperCV.pdf


