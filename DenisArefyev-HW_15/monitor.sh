#!/bin/bash

os_version=$(cat /etc/os-release | grep "PRETTY_NAME" | awk -F = '{print $2}' | sed 's/"//g')
current_date=$(date "+%D")
current_time=$(date "+%T")
uptime_info=$(uptime -p)
system_load=$(uptime | awk '{print $10" "$11" "$12}')
disk_space=$(df -h | grep "/$" | awk '{print $5}')
top_processes=$(ps aux --sort -rss | head -n 10 | awk '{print $2, $1, $6/1024 " MB"}')
process_count=$(ps -e | wc -l)
user_count=$(who | wc -l)

echo "System Report"  >> system_report.txt
echo "OS Version: " $os_version  >> system_report.txt
echo "Current Date: " $current_date  >> system_report.txt
echo "Current Time: " $current_time  >> system_report.txt
echo "Uptime Info: " $uptime_info  >> system_report.txt
echo "System load: " $system_load  >> system_report.txt
echo "Disk Space: " $disk_space  >> system_report.txt
echo "Top Processes: " $top_processes  >> system_report.txt
echo "Process Count: " $process_count  >> system_report.txt
echo "User Count: " $user_count  >> system_report.txt
