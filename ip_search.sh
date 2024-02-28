#!/bin/bash

# IP addresses to search for
ip_addresses='155.133.5.15\|155.133.5.14\|118.69.65.60\|118.69.65.61\|207.148.120.105\|192.210.232.93\|159.203.191.1'

# Find all files with _objects.json in the filename
files=$(find . -type f -name '*_objects.json')

# Loop through each file and search for IP addresses
for file in $files; do
  output_file="${file%.*}_filtered.txt"
  grep -E "$ip_addresses" "$file" > "$output_file"
  echo "Filtered results saved in $output_file"
done
