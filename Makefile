TEX = pdflatex -interaction nonstopmode
BIB = bibtex
GS = gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite

#COVER = cover
#PAPER = paper_main
#SUPP = paper_supp
#BIBFILE = temp.bib
#BUNDLE = paper_bundle.pdf

FILE = LeeperCV
JOB = LeeperCV_build

#all: $(COVER).pdf $(PAPER).pdf $(SUPP).pdf
all: resume cv


#$(GS) -sOutputFile=$(BUNDLE) $(COVER).pdf $(PAPER).pdf $(SUPP).pdf

#view: $(BUNDLE)
#	open $(BUNDLE)

spell:
	ispell *.tex

clean:
	rm -fv *.aux *.log *.bbl *.blg *.toc *.out *.lot *.lof  Leeper*.pdf

resume:
	$(TEX) -jobname=$(JOB) -interaction=nonstopmode "\newcommand\ResumeCV{0}\input{$(FILE).tex}"
	$(TEX) -jobname=$(JOB) -interaction=nonstopmode "\newcommand\ResumeCV{0}\input{$(FILE).tex}"
	mv $(JOB).pdf LeeperResume.pdf

cv:
	$(TEX) -jobname=$(JOB) -interaction=nonstopmode "\newcommand\ResumeCV{1}\input{$(FILE).tex}"
	$(TEX) -jobname=$(JOB) -interaction=nonstopmode "\newcommand\ResumeCV{1}\input{$(FILE).tex}"
	mv $(JOB).pdf LeeperCV.pdf


#$(PAPER).pdf: $(PAPER).tex $(PAPER).bbl
#	$(TEX) $(PAPER)
#	$(TEX) $(PAPER)

#$(PAPER).bbl: $(PAPER).tex $(BIBFILE)
#	$(TEX) $(PAPER)
#	$(BIB) $(PAPER)

#$(SUPP).pdf: $(SUPP).tex $(SUPP).bbl
#	$(TEX) $(SUPP)
#	$(TEX) $(SUPP)

#$(SUPP).bbl: $(SUPP).tex $(BIBFILE)
#	$(TEX) $(SUPP)
#	$(BIB) $(SUPP)
