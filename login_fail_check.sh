#!/bin/bash

file="/var/log"

# Input log file
cat $file/secure* |grep -w "Failed" >log.log
logfile="log.log"

# Extract hostname from the log file
hostname=$(awk '{print $5; exit}' "$logfile")

# Output CSV file with hostname in the filename
csvfile="${hostname}_FAILED_login.csv"


# Add header row
echo "Date,Time,Host,User,IP" > "$csvfile"

# Extract columns and save as CSV
awk '{
    date=$1 " " $2 " " $3
    time=$4
    host=$5
    user=$12
    ip=$14
    printf "%s,%s,%s,%s,%s\n", date, time, host, user, ip
}' "$logfile" > "$csvfile"

echo "CSV file generated: $csvfile"
