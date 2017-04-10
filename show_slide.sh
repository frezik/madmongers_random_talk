#!/bin/bash
FILE=$1
# Get the terminal width in a semi-portable way
TERM_WIDTH=`stty size | perl -E '$_=<>; chomp; $_=(split)[1]; say'` 

DATA=`cat ${FILE}`

# Outputs the filename centered at the top of the screen.
# We also output a carriage return, which allows the screen text 
# to overwrite the output by having text on the first line.
# If you do this, fill out the rest of the line with whitespace to 
# write over everything.
echo -ne "\e[30m"
perl -E '$f = q{***  } . shift . q{ ***}; $w = shift; say( " " x ($w / 2 - length($f) / 2) . $f . "\r")' ${FILE} ${TERM_WIDTH}
echo -ne "\e[0m"

echo -e "${DATA}" # Allows bash to interpret any escape sequences
echo -e "\e[0m" # Clear any escape sequences that were left open
perl -E '<>;' # Wait for enter key
clear
