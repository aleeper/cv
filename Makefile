### Fun with colors.
CWHITE="\\x1B[0m"
CGREEN="\\x1B[32m"
CRED="\\x1B[31m"

### Specify the shell environment we expect to use.
SHELL := /bin/bash

### Specify latex-related build commands.
TEX := pdflatex -halt-on-error -shell-escape -interaction=nonstopmode
BIB = bibtex
GS = gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite

### Make the echo command obey escape sequences.
ECHO := echo -e

### Define a command for PDF viewing that will work on both Mac and Linux.
PDF_VIEW := $$(if [ "$$(uname)" == "Darwin" ]; then echo "open -a Preview"; else echo "evince"; fi;)

FILE = LeeperCV
JOB = LeeperCV_build

### Make targets:

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

view:
	@echo "Opening pdfs in viewer..."
	@$(PDF_VIEW) LeeperCV.pdf &
	@$(PDF_VIEW) LeeperResume.pdf &
