TEX = $(wildcard *.tex)
PDF = $(patsubst %.tex,%.pdf,$(TEX))
CC:=xelatex

help:
	@echo "Make `pwd`:"
	@echo " - pdfs - Not working"
	@echo " - pdf - Make named files"
	@echo " - clean"
	@echo " - all"
	@echo " - debug"
	@echo " - cv - Build my CV in Docker"
	@echo " - help"

cv:
	docker run -v $$PWD:/usr/local/src -w /usr/local/src jpbernius/xelatex xelatex main.tex

pdfs: $(PDF)
	$(CC) -o $@ $^

%.pdf: %.tex
	$(CC) $<


all: clean pdf

clean:
	rm -f *.log
	rm -f *.aux
	rm -f *.pdf
	rm -f *.out
pdf:
	$(CC) coverletter_datascience
	$(CC) coverletter.tex

$(TE): $(FILE)
	@echo $(FILE)
	@echo $(CC)
	$(CC) $(FILE).tex
%.tex: %
	$(CC) $<
pdfs: $(TEX)
debug:
	@echo $(TEX)
.PHONY: pdfs