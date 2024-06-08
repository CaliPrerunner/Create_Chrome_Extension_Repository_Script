# --------------------------
# Author: Marco Robles Date: 7-june-2024
#
# Hello! Welcome to my program
# this is a simple bash script that will create directories and files
# you will need to create a chrome extension.
# call the command and it will use the current directory you are in to create
# the files. Call the command and add a specific directory and it will use
# your specified directory to create the files
#
# Enjoy!
#--------------------------

#checks if the first argument is there or not
if [ -z "$1" ]; then

#if there was no path given 
echo 'Target directory was not specified. Using current directory'
TARGET_DIR=$(pwd)
echo "Target directory:  $TARGET_DIR"

#there was specified diectory
else
TARGET_DIR="$1"
fi

#checking if the variable targetdir is a valid directory to use
if [ ! -d $TARGET_DIR ]; then
echo 'You have not entered a valid directory path'
else

#appending to the target dir to create new directories
TARGET_DIR="${TARGET_DIR}/"
mkdir "${TARGET_DIR}/images"
mkdir "${TARGET_DIR}/popup"
touch "${TARGET_DIR}/popup/popup.html"
touch "${TARGET_DIR}/popup/popup.js"
touch "${TARGET_DIR}/popup/popup.css"

echo "<!idoctype html>
<html lang ="en">
<body>
<h1>Hello World!</h1>
<script src="popup.js"></script>
</body>
</html>" >> "${TARGET_DIR}/popup/popup.html"

#creating manifest file for chrome
touch "${TARGET_DIR}/manifest.json"
echo '{ "manifest_version": 3, "name": null, 
"description": null, 
"version": 1.0, 
"action": "popup/popup.html",  
"default_icon": "icons/null" }' > "${TARGET_DIR}/manifest.json"
fi

ls

exit 0
