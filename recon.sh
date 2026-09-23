#!/bin/bash
if [ $# -eq 1 ]; then

echo "Target: $1 "
echo "target : $1" > "$1_report.txt"

if ping -c 5 "$1" > /dev/null ; then

echo "reachable"
echo " reachable" >> "$1_report.txt"
else
echo "not reachable"
echo "not reachable" >> "$1_report.txt"

fi

echo "DNS information on $1 :"
X=$( nslookup "$1")
echo "$X"


echo "$X"  >> "$1_report.txt"


echo "the information was transmitted to this file $1_report.txt "
echo "report saved"
echo "recon complete"
else
echo "please provide a website name Ex= (google.com)"
fi
