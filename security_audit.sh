#!/bin/bash

echo "================================"
echo "       SECURITY AUDIT"
echo "================================"

echo "Username: $(whoami)" | tee SECURITY_REPORT.TXT
echo "Hostname: $(hostname)" | tee -a SECURITY_REPORT.TXT
echo "Date: $(date)" | tee -a SECURITY_REPORT.TXT

if [ "$(id -u)" -eq 0 ]; then
    echo "Root privileges: YES" | tee -a SECURITY_REPORT.TXT
else
    echo "Root privileges: NO" | tee -a SECURITY_REPORT.TXT
fi

U=$(id -u)
echo "UID: $U" | tee -a SECURITY_REPORT.TXT

echo "Network Information" | tee -a SECURITY_REPORT.TXT
echo "- - - - - - - - - -" | tee -a SECURITY_REPORT.TXT

i=$(ip addr | grep "inet " | awk '{print $2}')
echo "IP: $i" | tee -a SECURITY_REPORT.TXT

D=$(ip route | grep "default" | awk '{print $3}')
echo "Gateway: $D" | tee -a SECURITY_REPORT.TXT

echo "Listening Ports" | tee -a SECURITY_REPORT.TXT
echo "- - - - - - - -" | tee -a SECURITY_REPORT.TXT

ss -tuln | tee -a SECURITY_REPORT.TXT

echo "Running Processes" | tee -a SECURITY_REPORT.TXT
echo "- - - - - - - - -" | tee -a SECURITY_REPORT.TXT

ps | tee -a SECURITY_REPORT.TXT

echo "SSH SERVICE" | tee -a SECURITY_REPORT.TXT
echo "- - - - - -" | tee -a SECURITY_REPORT.TXT

if [ "$(systemctl is-active ssh)" = "active" ]; then
    echo "SSH is running" | tee -a SECURITY_REPORT.TXT
else
    echo "SSH is not running" | tee -a SECURITY_REPORT.TXT
fi

echo "RECENT LOGINS" | tee -a SECURITY_REPORT.TXT
echo "- - - - - - - -" | tee -a SECURITY_REPORT.TXT

last | tee -a SECURITY_REPORT.TXT

echo "================================"
echo "Audit complete"
echo "Report saved: SECURITY_REPORT.TXT"
echo "================================"
