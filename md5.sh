#!/bin/bash

for file in $(find / -path /proc -prune -o -path /var/tmp -prune -o -path /sys/kernel -prune -o -path /dev -prune -o -path /run -prune -o -path /mnt -prune -o -path /media -prune -o -path /sys/fs/cgroup -prune -o -type f -print); do
    md5sum "$file"
done
