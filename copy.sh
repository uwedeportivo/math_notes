#!/bin/bash

NOTE_DIRS='airplane_seating bernstein bridge burnside_polya catvsdog completeness counting divisible_by_three'
NOTE_DITS+=' dutch_national_flag enigma fibolucci grasshopper groovy hammingcode'
NOTE_DIRS+=' maxsum noconsecutiveints paying_dollar penn_teller pointsoncircle prison_cells'
NOTE_DIRS+=' sequences series threeplussqrtfive trailingzeros twelvecoins two_algebraic_delights twodecks while_a'


for NOTE_DIR in $NOTE_DIRS
do
    cd $NOTE_DIR
    echo copy $NOTE_DIR
    cp -f $NOTE_DIR.pdf /Users/uwe/src/blogs/sagenhaft/public/posts/math_notes/$NOTE_DIR/$NOTE_DIR.pdf
    cd ..
done

echo copy book
cp -f book.pdf /Users/uwe/src/blogs/sagenhaft/public/posts/math_notes/book.pdf
