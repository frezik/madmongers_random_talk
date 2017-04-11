#!/bin/bash
DIR=$1

for FILE in ${DIR}/screen*.txt
do
    ./show_slide.sh ${FILE}
done
