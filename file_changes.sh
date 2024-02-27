#!/bin/bash

# Directory to check
DIR="/"

# Get the current timestamp
CURRENT_TIMESTAMP=$(date +%s)

# Calculate the timestamp for one month ago (30 days)
ONE_MONTH_AGO=$(date -d "1 month ago" +%s)

# Find all files in the directory and subdirectories
find "$DIR" -type f | while read -r FILE; do
    # Get the last modification time of the file
    MODIFICATION_TIME=$(stat -c %Y "$FILE")

    # Check if the file was modified or created within the last month
    if [ "$MODIFICATION_TIME" -gt "$ONE_MONTH_AGO" ]; then
        echo "File $FILE was modified or created within the last month."
    fi
done
