#!/bin/bash

while [ true ]
do

echo "enter the target ip address/domain name:"
read ipd
echo "enter a port number (chose a number between 1-65535):"
read p

if nc -zv "$ipd" "$p" > /dev/null ; then
echo "the target is : $ipd"
echo "the target is : $ipd" > "$ipd"_report.txt

echo "the port we work on is : $p"
echo "the port we work on is : $p" >> "$ipd"_report.txt

echo "open"
echo "open" >> "$ipd"_report.txt
else
echo "the target is : $ipd"
echo "the target is : $ipd" > "$ipd"_report.txt

echo "the port we work on is : $p"
echo "the port we work on is : $p" >> "$ipd"_report.txt

echo "closed"
echo "closed" >> "$ipd"_report.txt

fi
echo "Report saved "
echo "Scan complete"

echo "Do you want to check another port? (y/n)"
read G
if [ "$G" = "n" ]; then
break
fi
done
