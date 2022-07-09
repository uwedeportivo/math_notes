#!/bin/bash

NOTE_DIRS='airplane_seating bernstein bridge catvsdog counting fibolucci grasshopper groovy hammingcode'
NOTE_DIRS+=' maxsum noconsecutiveints paying_dollar penn_teller pointsoncircle prison_cells'
NOTE_DIRS+=' sequences threeplussqrtfive trailingzeros twelvecoins while_a'


for NOTE_DIR in $NOTE_DIRS
do
    cd $NOTE_DIR
    echo processing $NOTE_DIR
    latexmk -pdf -f -silent $NOTE_DIR.tex
    cd ..
done

echo processing book
latexmk -pdf -f -silent book.tex
