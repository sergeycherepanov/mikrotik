#!/usr/bin/env bash

function info {
  printf "\033[0;36m${1}\033[0m \n"
}
function note {
  printf "\033[0;33m${1}\033[0m \n"
}
function success {
  printf "\033[0;32m${1}\033[0m \n"
}
function warning {
  printf "\033[0;95m${1}\033[0m \n"
}
function error {
  printf "\033[0;31m${1}\033[0m \n"
  exit 1
}

ROUTER_IP=$1

note "Target IP for hosts (127.0.0.1 if empty):"
read TARGET_IP

if [[ -z ${TARGET_IP} ]]; then
  TARGET_IP="127.0.0.1"
fi

warning "Reading hosts..."

COMMANDS=$(curl https://someonewhocares.org/hosts/hosts 2>/dev/null | grep -v "#" | awk '{if ($2) print $2}' | xargs -I {} echo "/ip dns static add name={} address=${TARGET_IP}")

success "Rows fetched:$(echo "${COMMANDS}" | wc -l)"

warning "Configure router"
echo "${COMMANDS}" | ssh -T -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no admin@${ROUTER_IP}

success "Router updated"
