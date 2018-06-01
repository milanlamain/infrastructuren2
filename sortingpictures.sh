# This program allows to sort pictures into different subfolders based on the date.

printf "Input directory where the pictures are stored:"
read directory

printf "How do the pictures need to be sorted? (type week or month):"
read worm #week or month = worm

DIR=$directory   #$directory #Store user input directory in the variable

if [ -d ~/"$directory" ] #If userinput is a directory continue else exit
then echo "Directory is found"	
else
	echo "Directory not found script aborting."
	exit
fi

#Loop through directory and echo the files for debugging purpose
for i in ~/$DIR/*
do
	echo file: $i
done

#If user typed in 'month' then this if statement will go through
find ~/$DIR/* -maxdepth 1 -type f |
for i in ~/$DIR/* 
do
if [ $worm == 'month' ];then
	#Get file dates
	month="$(date -d "$(stat -c %y "$i")" +%b)"
	#echo $month
	
	#If the folder of the month does not exist make the folder
	[[ ! -d "$BASE_DIR/$month" ]] && mkdir -p "$DIR/$month";

	#Copy the files to the new directory
	cp "$i" "$DIR/$month"

else [ $worm == 'week' ];then
	#Get file dates
	week="$(date -d "$(stat -c %y "$i")" +%W)"
	#echo $week
	
	#If the folder of the month does not exist make the folder
	[[ ! -d "$BASE_DIR/$week" ]] && mkdir -p "$DIR/$week";

	#Copy the files to the new directory
	cp "$i" "$DIR/$week"


fi
done


# mkdir to create folders. cp to copy files. mv used to move and/or rename files.
