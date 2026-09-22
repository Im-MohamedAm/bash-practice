#!/bin/bash
if [ $# -ge 1 ]; then
if [ -f "$1" ]; then
echo "file: $1"
grep "ERROR" "$1"
y=$(grep "ERROR" "$1" | wc -l )

echo "number of ERROR is : $y " 
echo "analysis complete."
else
echo "not a file."
fi
else
echo "Please provide a file."
fi
