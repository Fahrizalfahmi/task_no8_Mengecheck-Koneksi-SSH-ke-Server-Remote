#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <username> <ip_address>"
    exit 1
fi

username="$1"
ip_address="$2"

echo "Attempting SSH connection to $username@$ip_address..."

ssh -o BatchMode=yes -o ConnectTimeout=5 "$username@$ip_address" "echo Connection successful" >/dev/null 2>&1

if [ $? -eq 0 ]; then
    echo "SSH connection successful."
else
    echo "SSH connection failed."
fi
