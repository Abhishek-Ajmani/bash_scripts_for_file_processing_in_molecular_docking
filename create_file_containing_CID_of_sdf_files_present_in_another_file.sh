#!/bin/bash

#this script creates a file which contains the CID of all molecules for which one file containing sdf files was downloaded from pubchem database

#this gives the number of sdf files written in the single file in current folder for conversion 
number_of_names_to_write=$(grep -o '\$\$\$\$' try.txt | wc -l)

#for loop which runs the number of times, the number of sdf files present
for (( i=1; i<=$number_of_names_to_write; i++ ));

do

#this adds the first line which is the CID number of molecule
head -n 1 try.txt >> ram.txt

#this counts the number of lines exist for a single sdf file or the single sdf file in the file containing all sdf files based on end line containing '$$$$' term
number_of_lines_to_copy_or_remove=$(grep -n '$$$$' try.txt | head -n 1 | cut -d: -f1 | xargs -I {} expr {})

#this removes the number of lines counted from the above expression
sed -i '1,'$number_of_lines_to_copy_or_remove'd' try.txt

done
