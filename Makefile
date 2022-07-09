PROJNAME = all

NOTES = airplane_seating bernstein bridge catvsdog counting fibolucci grasshopper groovy hammingcode \
	maxsum noconsecutiveints paying_dollar penn_teller pointsoncircle prison_cells \
	sequences threeplussqrtfive trailingzeros twelvecoins while_a


NOTE_SRCS = $(foreach fd, $(NOTES), $(fd)/*_content.tex)


$(PROJNAME).pdf: $(PROJNAME).tex $(NOTE_SRCS)
	latexmk -pdf -silent -use-make $<

cleanall:
	latexmk -C

clean:
	latexmk -c
