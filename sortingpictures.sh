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
#Ik heb gekozen om een if else statement te doen. Het is niet de meeste elegante oplossing maar het werkt wel. De rest van de comments zijn in engels omdat de keywoorden in die taal makkelijker zijn.
find ~/$DIR/* -maxdepth 1 -type f |
for i in ~/$DIR/* 
do
if [ $worm == 'month' ];then
	#Get file date
	month="$(date -d "$(stat -c %y "$i")" +%b)"
	#echo $month (Debugging)
	
	#If the folder of the month does not exist make the folder
	[[ ! -d "$BASE_DIR/$month" ]] && mkdir -p "$DIR/$month";

	#Copy the files to the new directory
	cp "$i" "$DIR/$month"
	
	#/dev/null Is being used to store the temporary file otherwise rm would just remove it
	if diff $i $DIR/$month >/dev/null ;then
	rm $i
	fi

else [ $worm == 'week' ]
	#Get file dates
	week="$(date -d "$(stat -c %y "$i")" +%W)"
	#echo $week 
	
	#If the folder of the month does not exist make the folder
	[[ ! -d "$BASE_DIR/$week" ]] && mkdir -p "$DIR/$week";

	#Copy the files to the new directory
	cp "$i" "$DIR/$week"

	if diff $i $DIR/$week >/dev/null ;then
	rm $i
	fi

fi
done


# mkdir to create folders. cp to copy files. mv used to move and/or rename files.
