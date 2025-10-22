#!/bin/bash

#this command counts the number of lines present in the file containing list of names/CID of molecules
number_of_lines_in_file_containing_names=$(sed -n '$=' ram.txt)

#echo $number_of_lines_in_file_containing_names

#for loop which runs the number of times, the number of lines present in the file containing names/CID of molecules
for (( i = 1; i <= $number_of_lines_in_file_containing_names; i++ ))

do 

#this stores the first line which is the name/CID of molecule in a variable 'rename'
rename=$(head -n 1 ram.txt)

#echo $rename

#this rename the sdf file to the value contained in the variable 'rename'
sudo mv $i.sdf $rename.sdf

#this removes the first line of the file containing the list of names/CID of molecules
sed -i '1d' ram.txt

done
