#!/bin/bash

echo "========================================"
echo "       SERVER PERFORMANCE STATS"
echo "========================================"

echo ""
echo "CPU USAGE:"
ps -eo %cpu | awk 'NR>1 {sum += $1} END {print sum "%"}'

echo ""
echo "MEMORY USAGE:"
free -h

echo ""
echo "DISK USAGE:"
df -h /

echo ""
echo "TOP 5 PROCESSES BY CPU:"
ps -eo pid,%cpu,comm --sort=-%cpu | head -n 6

echo ""
echo "TOP 5 PROCESSES BY MEMORY:"
ps -eo pid,%mem,comm --sort=-%mem | head -n 6

echo ""
echo "========================================"
echo "          ANALYSIS COMPLETE"
echo "========================================"

