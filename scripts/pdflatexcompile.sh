#!/bin/bash
# script compile tex file with pdflatex, open the generated pdf with Zathura
# and delete junk auxiliary files 

# Get file and directory of the file
doc=$1
directory=$(dirname $doc)

# Compile three times for references and stuff
pdflatex --output-directory=$directory $doc 
pdflatex --output-directory=$directory $doc 
pdflatex --output-directory=$directory $doc 

# Get into the working directory and get the basename of the working file
#echo $directory
cd $directory
newdoc=$(basename $doc | cut -d "." -f 1)

# Check which instances have opened the generated pdf
check=$(ps aux | grep $newdoc.pdf | wc -l)

if [ $check -gt 1 ]
then
	# do nothing if the pdf file is already opened
	echo "Updating $newdoc.pdf view"
else
	# if the pdf is not opened then open it with Zathura
	# by default Zathura updates the pdf on every change so just
	# disown the process and continue with the script
	zathura $newdoc.pdf  & disown
	echo "Opening $newdoc.pdf"
fi

# clean junk axuliary files created by pdflatex
# using CleanLatexJunk script by Christoph Graumann
base=$(basename $doc)
directory=$(dirname $base)
~/.config/texstudio/cleanlatexjunk.sh -f $basename $directory
