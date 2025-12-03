#!/usr/bin/env bash

# localhostrun - A script to expose local services via localhost.run
# Usage: localhostrun <port> [subdomain]

set -euo pipefail

PORT=${1:-8080}
SUBDOMAIN=${2:-""}

if [[ ! "$PORT" =~ ^[0-9]+$ ]]; then
    echo "Error: Port must be a number" >&2
    echo "Usage: localhostrun <port> [subdomain]" >&2
    exit 1
fi

if [[ $PORT -lt 1 || $PORT -gt 65535 ]]; then
    echo "Error: Port must be between 1 and 65535" >&2
    exit 1
fi

echo "Exposing localhost:$PORT via localhost.run..."

ssh_args=(-o StrictHostKeyChecking=no -aT)

if [[ -n "$SUBDOMAIN" ]]; then
    echo "Requesting subdomain: $SUBDOMAIN"
    ssh_args+=(-R "$SUBDOMAIN:80:localhost:$PORT")
else
    ssh_args+=(-R "80:localhost:$PORT")
fi

if [ -n "${TIMEOUT_SECONDS:-}" ]; then
    timeout "${TIMEOUT_SECONDS}" ssh "${ssh_args[@]}" ssh.localhost.run
else
    ssh "${ssh_args[@]}" ssh.localhost.run
fi
