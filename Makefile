SOURCEDIR = src
BUILDDIR = bin
RESDIR = res
TEMPDIR = temp

all:
	latexmk -pdf -output-directory=../../$(BUILDDIR) -cd $(SOURCEDIR)/$(RESDIR)/*.tex
	latexmk -pdf -output-directory=../$(BUILDDIR) -cd $(SOURCEDIR)/*.tex
	latexmk -c -output-directory=../../$(BUILDDIR) -cd $(SOURCEDIR)/$(RESDIR)/*.tex
	latexmk -c -output-directory=../$(BUILDDIR) -cd $(SOURCEDIR)/*.tex

clean:
	rm -rf $(BUILDDIR)/*

clear:
	rm -rf $(TEMPDIR)/*
