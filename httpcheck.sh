#!/bin/bash
while [ true ]
do
echo "Enter a website URL (EX:http://example.com) :"
read w

filename="${w//\//_}_report.txt"

val=$( curl -o /dev/null -s -w "%{http_code}\n" "$w" )

if [[ "$val" -ge 200 && "$val" -lt 300 ]]; then
echo "Target : $w" | tee "$filename"
echo "Status Code : $val" | tee -a "$filename"
echo "Status : Online & request succeeded" | tee -a "$filename"

elif [[ "$val" -ge 300 && "$val" -lt 400 ]]; then
echo "Target : $w" | tee "$filename"
echo "Status Code : $val" | tee -a "$filename"
echo "Status : Online, but redirected to another URL" | tee -a "$filename"

elif [[ "$val" -ge 400 && "$val" -lt 500 ]]; then
echo "Target : $w" | tee "$filename"
echo "Status Code : $val" | tee -a "$filename"
echo "Status : Server online, but request is invalid" | tee -a "$filename"

else
echo "Target : $w" | tee "$filename"
echo "Status Code : $val" | tee -a "$filename"
echo "Status : Server error, down, or failing" | tee -a "$filename"
fi

echo "The informations about this file are saved here: $filename"
echo "Report saved."

echo "Do you want to check another website? (y/n)"
read R

if [ "$R" != y ]; then
break
fi
done
