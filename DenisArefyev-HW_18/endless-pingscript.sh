#!/bin/bash
#
#
read -p "Enter the address to ping: " address

while true; do
    ping -c 1 -W 1 "$address" > /dev/null && echo "Ping to $address successful." || echo "Failed to ping $address."
    sleep 1
done
