#!/bin/bash
if [[ "$#" -ge 1 && -d "$1" ]] ; then

D=$(date)
mkdir archive 
tar -czvf archive/archive.tar.gz "$1"

echo "archive created: $D" >> archive.log
echo "archive created successfully ."
echo "saved in archive/archive.tar.gz "
else

echo "no argument was provided or the argument isnt a directory"

fi
