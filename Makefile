NOTE_DIRS = airplane_seating bernstein bridge catvsdog counting fibolucci grasshopper groovy hammingcode \
	maxsum noconsecutiveints paying_dollar penn_teller pointsoncircle prison_cells \
	sequences threeplussqrtfive trailingzeros twelvecoins while_a


NOTE_FILES = $(foreach fd, $(NOTE_DIRS), $(fd)/*_content.tex)


.PHONY: all

all: $(NOTE_DIRS)

$(NOTE_DIRS):
	$(MAKE) -C $@ clean all

book: book.tex $(NOTE_FILES)
	latexmk -pdf -silent -use-make $<

cleanall:
	latexmk -C

clean:
	latexmk -c
