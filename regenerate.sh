#!/bin/bash

NOTE_DIRS='airplane_seating bernstein bridge burnside_polya catvsdog completeness counting divisible_by_three'
NOTE_DITS+=' dutch_national_flag enigma fibolucci grasshopper groovy hammingcode'
NOTE_DIRS+=' maxsum noconsecutiveints nthroot paying_dollar penn_teller pointsoncircle prison_cells'
NOTE_DIRS+=' sequences series threeplussqrtfive trailingzeros twelvecoins two_algebraic_delights twodecks while_a'


for NOTE_DIR in $NOTE_DIRS
do
    cd $NOTE_DIR
    echo processing $NOTE_DIR
    latexmk -pdf -f -silent $NOTE_DIR.tex
    cd ..
done

echo processing book
latexmk -pdf -f -silent book.tex
