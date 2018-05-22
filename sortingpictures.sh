# This program allows to sort pictures into different subfolders based on the date.

printf "Input directory where the pictures are stored:"
read directory

printf "How do the pictures need to be sorted? (type week or month):"
read worm

dir=$directory   #$directory #Store user input directory in the variable

if [ -d ~/"$directory" ] #If userinput is a directory continue else exit
then echo "Directory is found"	
else
	echo "Directory not found script aborting."
	exit
fi

#Loop through directory
for i in ~/$dir/*
do
	echo file: $i
done

# mkdir to create folders. cp to copy files. mv used to move and/or rename files.

