##!/bin/bash

echo "network trace route scaaner from an ip ,from liosharl................................ "

# Check if the user provided a target IP address
if [ -z "$1" ]; then
    echo "Usage: $0 <target_ip>"
    exit 1
fi

# Set the target IP address
TARGET_IP="$1"

# Run arp-scan to find the network the target IP is located in
arp-scan --interface=wlan0 --localnet | grep -E "($TARGET_IP)" > network_range.txt

# Extract the network range from the arp-scan output
NETWORK_RANGE=$(grep -oP '(?:\d{1,3}\.){3}\d{1,3}' network_range.txt | sort -u | head -n1 | cut -d. -f1-3)

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