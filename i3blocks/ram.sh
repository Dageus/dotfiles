#!/bin/bash

# Get memory info
mem_total=$(free -h | awk '/Mem:/ {print $2}')
mem_used=$(free -h | awk '/Mem:/ {print $3}')

# Convert to MB
mem_total_gib=$(awk "BEGIN {printf \"%.2f\", $mem_total / 1024 / 1024}")
mem_used_gib=$(awk "BEGIN {printf \"%.2f\", ($mem_used) / 1024 / 1024}")

# Output format: "Used / Total MB"
echo "$mem_used/$mem_total"
