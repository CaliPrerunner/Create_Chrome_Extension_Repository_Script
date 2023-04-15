#! /Users/marco/Documents/myProjects/bashScripts

#checking if there is a file passed if not it ends program
if [ -z $1]; then
echo "There has not been a file path passed. Please try again"
exit
fi

#function to run 
diskutil info $1
diskutil eraseDisk FAT32 MBRFormat $1
diskutil info $1

exit




