#!/bin/bash

while true
do
    echo "Enter a website name:"
    read target

    echo "Target: $target"
    echo "target: $target" > "$target"_report.txt

    if ping -c 5 "$target" > /dev/null 2>&1; then
        echo "reachable"
        echo "reachable" >> "$target"_report.txt
    else
        echo "not reachable"
        echo "not reachable" >> "$target"_report.txt
    fi

    echo "DNS information on $target:"
    X=$(nslookup "$target")
    echo "$X"
    echo "$X" >> "$target"_report.txt

    echo "The information was transmitted to this file: $target"_report.txt
    echo "Report saved"
    echo "Recon complete"

    echo "Do you want to analyze another website? (y/n)"
    read answer

    if [ "$answer" = "n" ]; then
        break
    fi
done
