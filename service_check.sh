#!/bin/bash

REPORT="service_report.txt"
> "$REPORT"

check_service() {
 echo "Service: $1" | tee -a "$REPORT"

 R=$(systemctl status "$1" 2>/dev/null | grep "Active:" | awk '{print $2}')

    if [ "$R" = "active" ]; then
  echo "Status: RUNNING" | tee -a "$REPORT"
   ((running++))
    else
        echo "Status: NOT RUNNING" | tee -a "$REPORT"
    fi

 ((checked++))
  echo "--------------------" | tee -a "$REPORT"
}

while true
do
    echo "================================"
    echo "       SERVICE CHECKER"
    echo "================================"

    echo "Enter a service name:"
  read service

  check_service "$service"

  echo "Do you want to check another service? (y/n)"
 read A

 if [ "$A" = "n" ]; then
  break
 fi
done

echo "Service Checked: $checked" | tee -a "$REPORT"
echo "Running: $running" | tee -a "$REPORT"
echo "Report Saved: $REPORT"
