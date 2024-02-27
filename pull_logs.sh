#!/bin/bash

# Output directory for the tar.gz file
OUTPUT_DIR="/home/admin"

# Get the hostname
HOSTNAME=$(hostname)

# Create a unique filename for the archive based on the current date and time
OUTPUT_FILE="$OUTPUT_DIR/logs_${HOSTNAME}_$(date +%Y%m%d%H%M%S).tar.gz"

# Create a tar.gz archive of /var/log/messages* and /var/log/secure*
tar -czvf "$OUTPUT_FILE" /var/log/messages* /var/log/secure*

echo "Archive created: $OUTPUT_FILE"
