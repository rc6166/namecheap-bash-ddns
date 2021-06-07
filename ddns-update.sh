#!/bin/bash

# Janky bash input validation. If 3 arguments aren't put in, shows error message
if [ "$#" -ne 3 ]; then
	>&2 echo "Syntax: ./ddns-update.sh <host> <domain> <DDNS password>"

# Update DDNS entry with Namecheap API
else
    # This block gets the IP stored in the DDNS entry and formats it
    dig +short $1.$2 > /tmp/temp.txt
    tr -d '\n' < /tmp/temp.txt > /tmp/dns.txt && rm /tmp/temp.txt
    DNS_IP=$(cat /tmp/dns.txt)
    
    # Get current WAN IP from ifconfig.me
    curl -s ifconfig.me > /tmp/current.txt
    CURRENT_IP=$(cat /tmp/current.txt)

    # If current IP doesn't match DDNS IP, then script updates DDNS
    if [ $CURRENT_IP != $DNS_IP ]; then
        curl -s -X GET "https://dynamicdns.park-your-domain.com/update?host=$1&domain=$2&password=$3"
    fi
fi