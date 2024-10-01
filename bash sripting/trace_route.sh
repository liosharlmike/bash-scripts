#!/bin/bash

echo "network tracer  from liosharl................................ "



# Check if the user provided a target IP address
if [ -z "$1" ]; then
    echo "Usage: $0 <target_ip>"
    exit 1
fi

# Set the target IP address
TARGET_IP="$1"

# Run traceroute to determine the route taken by the network
traceroute -n "$TARGET_IP"