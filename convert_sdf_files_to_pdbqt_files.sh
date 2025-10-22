#!/bin/bash

#this expression counts the number of sdf files present in the current folder to be converted to pdbqt files
number_of_files_in_folder=$(ls -l | grep "sdf" | wc -l)

#for loop which runs the number of times, the number of sdf files present in the current folder
for (( i=1; 1 <= number_of_files_in_folder; i++ ));

do

#the first line of the file containing the list of names/CID of molecules is stored in variable 'name'
name=$(head -n 1 names.txt)

#obabel converts the sdf file to an intermediate 3d file with extension '.mol2' and name it on the basis of variable 'name'
obabel -isdf $name.sdf -omol2 -O $name.mol2 --gen3d

#obabel converts the intermediate .mol2 file to the final .pdbqt file and name it on the basis of variable 'name'
obabel -imol2 $name.mol2 -Opdbqt -O $name.pdbqt

#this removes the first line of the file containing the list of names/CID of molecules
sed -i '1d' names.txt
done

