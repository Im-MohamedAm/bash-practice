#!/bin/bash
if [[ "$#" -ge 1 && -d "$1" ]] ; then

D=$(date)
mkdir archive 
tar -czvf archive.tar.gz "$1"

else
echo "no argument was provided or the argument isnt a directory"
