#!/bin/bash

echo "================================"
echo "        RECON TOOL"
echo "================================"

echo "Enter target:"
read target

REPORT="recon_${target}.txt"

echo "Target: $target" | tee "$REPORT"

echo "" | tee -a "$REPORT"
echo "===== PING =====" | tee -a "$REPORT"

if ping -c 2 "$target" > /dev/null 2>&1; then
    echo "Target is reachable" | tee -a "$REPORT"
else
    echo "Target is not reachable" | tee -a "$REPORT"
fi

echo "" | tee -a "$REPORT"
echo "===== DIG =====" | tee -a "$REPORT"

dig "$target" | grep -E "ANSWER SECTION|^[^;].*IN.*" | tee -a "$REPORT"

echo "" | tee -a "$REPORT"
echo "===== HOST =====" | tee -a "$REPORT"

host "$target" | tee -a "$REPORT"

echo "" | tee -a "$REPORT"
echo "===== TRACEROUTE =====" | tee -a "$REPORT"

traceroute "$target" | tee -a "$REPORT"

echo "" | tee -a "$REPORT"
echo "===== WHOIS =====" | tee -a "$REPORT"

whois "$target" | tee -a "$REPORT"

echo "" | tee -a "$REPORT"
echo "================================" | tee -a "$REPORT"
echo "       RECON COMPLETE" | tee -a "$REPORT"
echo "================================" | tee -a "$REPORT"

echo "Report saved: $REPORT"
