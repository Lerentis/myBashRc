#!/bin/bash
FILES=$(find . -type f -name "*.pdf")
echo " " $FILES
gs -q -sPAPERSIZE=a4 -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=output.pdf $FILES
