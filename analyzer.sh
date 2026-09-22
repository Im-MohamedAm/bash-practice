#!/bin/bash
if [ $# -ge 1 ]; then
if [ -d "$1" ]; then

echo "user $(whoami)"
echo "directory: $1"
echo "the file(s) inside the directory mention above are/is : "

for file in "$1"/*
do
echo "$file"
done
echo "analysis complete."
else
echo "not a directory"
fi
else
echo "please provide a directory name."
fi
