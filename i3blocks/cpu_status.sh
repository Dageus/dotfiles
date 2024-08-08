#!/bin/bash

# Get CPU usage
cpu_usage=$(sar -u 1 1 | awk 'FNR == 5 { printf "%04.1f", (100 - $8) }')

# Print with HTML formatting
echo "$cpu_usage<span color=\"#f8f8f2\">%</span>"
