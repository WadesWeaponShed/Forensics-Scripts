#!/bin/bash

# Set the management server IP, username, and password
#MGMT_SERVER="your_mgmt_server_ip"
#USERNAME="your_username"
#PASSWORD="your_password"
#!/bin/bash

# Set the management server IP, username, and password
#MGMT_SERVER="your_mgmt_server_ip"
#!/bin/bash

# Set the management server IP, username, and password
#MGMT_SERVER="your_mgmt_server_ip"
#USERNAME="your_username"
#PASSWORD="your_password"

# Set the list of specific source IP addresses separated by commas
SOURCE_IPS="155.133.5.15,155.133.5.14,118.69.65.60,118.69.65.61,207.148.120.105,192.210.232.93,159.203.191.1"

# Set the output file
OUTPUT_FILE="logs_output.txt"

# Set the start and end dates for the search (30 days ago from today to today)
START_DATE=$(date -d "30 days ago" "+%Y-%m-%dT%H:%M:%S")
END_DATE=$(date "+%Y-%m-%dT%H:%M:%S")

# Set the initial offset and limit
#OFFSET=0
#LIMIT=500

# Use mgmt_cli to show logs with the specified source IP addresses from the last 30 days
while true; do
    # Fetch logs in batches
    logs=$(mgmt_cli -r true -d X.X.X.X show logs new-query.time-frame "this-month" new-query.filter  "or-filter: (src=$SOURCE_IPS)" --format json)

    # Check if there are no more logs to fetch
    if [ -z "$logs" ]; then
        break
    fi

    # Append logs to the output file
    echo "$logs" >> $OUTPUT_FILE

    # Increment the offset
    OFFSET=$((OFFSET + LIMIT))
done
