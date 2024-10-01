#!/bin/bash

echo "network scanner from liosharl................................ "


# Check if the user provided a network range
if [ -z "$1" ]; then
    echo "Usage: $0 <network_range>"
    exit 1
fi

# Set the network range
NETWORK_RANGE="$1"

# Run nmap to scan the network and store the output in a file
nmap -sn "$NETWORK_RANGE" > nmap_output.txt

# Check if nmap was successful
if [ $? -eq 0 ]; then
    # Print the list of devices and their IP addresses
    echo "Devices and their IP addresses:"
    grep "Host:" nmap_output.txt | awk '{print $2}'
else
    echo "Failed to scan the network."
fi