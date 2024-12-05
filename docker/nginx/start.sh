#!/bin/bash

# configure iptables for Suricata IPS
iptables -I INPUT -j NFQUEUE
iptables -I OUTPUT -j NFQUEUE

# Start Suricata
/docker-entrypoint.sh -q 0 -vvv &

# Start Nginx
nginx -g "daemon off;"
