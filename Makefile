SOURCEDIR = src
BUILDDIR = bin
ENCLDIR = encl
TEMPDIR = temp

all:
	#latexmk -pdf -output-directory=../../$(BUILDDIR) -cd $(SOURCEDIR)/$(ENCLDIR)/*.tex
	latexmk -pdf -output-directory=../$(BUILDDIR) -cd $(SOURCEDIR)/*.tex

clean:
	rm -rf $(BUILDDIR)/*

clear:
	rm -rf $(TEMPDIR)/*
