#!/bin/bash

LOG="$1"

if [[  ! -f "$LOG" ]]; then
    echo "Error: log file not found."
    exit 1
fi

echo "========================================"
echo "        NGINX LOG ANALYSER"
echo "========================================"

echo ""
echo "Top 5 IP addresses with the most requests:"
awk '{print $1}' "$LOG" | sort | uniq -c | sort -nr | head -n 5

echo ""
echo "Top 5 most requested paths:"
awk '{print $7}' "$LOG" | sort | uniq -c | sort -nr | head -n 5

echo ""
echo "Top 5 response status codes:"
awk '{print $9}' "$LOG" | sort | uniq -c | sort -nr | head -n 5

echo ""
echo "Top 5 user agents:"
awk -F'"' '{print $6}' "$LOG" | sort | uniq -c | sort -nr | head -n 5

echo ""
echo "========================================"
echo "          ANALYSIS COMPLETE"
echo "========================================"
