# This program allows to sort pictures into different subfolders based on the date.

DEFAULTDIR='~/Pictures'

printf "Input directory where the pictures are stored:"
read $1

printf "How do the pictures need to be sorted?: (type week or month)"
read worm

dir=$1 #Store user input directory in the variable

if [ -d "$1"];


# mkdir to create folders. cp to copy files. mv used to move and/or rename files.

