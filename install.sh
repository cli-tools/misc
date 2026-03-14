#!/bin/sh
# Meta-installer for cli-tools/misc
# Usage (remote): curl -fsSL https://cli-tools.github.io/misc/install.sh | sh
# Usage (local):  sh install.sh

set -eu

BASE_URL="https://cli-tools.github.io/misc/bin"
SCRIPT_DIR="$(CDPATH='' cd -- "$(dirname -- "$0")" 2>/dev/null && pwd)/bin"

fetch() {
    if command -v curl >/dev/null 2>&1; then
        curl -fsSL "$1"
    elif command -v wget >/dev/null 2>&1; then
        wget -qO- "$1"
    else
        echo "Error: curl or wget required" >&2
        exit 1
    fi
}

run_script() {
    if [ -d "$SCRIPT_DIR" ] && [ -f "$SCRIPT_DIR/$1" ]; then
        echo "=> Running $1 (local) ..."
        sh "$SCRIPT_DIR/$1"
    else
        echo "=> Running $1 (remote) ..."
        fetch "$BASE_URL/$1" | sh
    fi
}

SCRIPTS="
install-network-tools.sh
"

for script in $SCRIPTS; do
    run_script "$script"
done

echo "=> All tools installed."
