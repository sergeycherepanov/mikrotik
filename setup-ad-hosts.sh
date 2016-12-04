#!/usr/bin/env bash

ROUTER_IP=$1

note "Target IP (127.0.0.1):"
read TARGET_IP

TARGET_IP=${TARGET_IP-"127.0.0.1"}

curl http://someonewhocares.org/hosts/hosts 2>/dev/null | grep -v "#" | awk '{if ($2) print $2}' | xargs -I {} bash -c "echo {}; bash -c 'ssh admin@${ROUTER_IP} /ip dns static add name={} address=${TARGET_IP}'"
