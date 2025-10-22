#!/bin/bash

#command for counting number of sdf files based on end line containing '$$$$' expression
number_of_files_to_create=$(grep -o '\$\$\$\$' try.txt | wc -l)

#for loop which runs the number of times, the number of files to be created 
for (( i=1; i<=$number_of_files_to_create; i++ ));

do

#command counts the number of lines present in a single sdf file based on '$$$$' in the end line of file
number_of_lines_to_copy_or_remove=$(grep -n '$$$$' try.txt | head -n 1 | cut -d: -f1 | xargs -I {} expr {})

#head -n 1 try.txt >> ram.txt
#name="head -n 1 try.txt"

#this command extracts the number of lines as counted from above expression and writes it into the output/sdf file
sed -n '1,'$number_of_lines_to_copy_or_remove'p' try.txt > $i.sdf

#this command deletes the number of lines as counted from above expression from the clubbed file
sed -i '1,'$number_of_lines_to_copy_or_remove'd' try.txt

done
