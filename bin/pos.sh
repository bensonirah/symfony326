#!/bin/bash

set -fe

function help() {
    figlet "pos-cli"
    echo ""
    echo "Usage:  pos [OPTIONS] COMMAND"
    echo ""
}

if [ $# -lt 1 ]; then
    help
else
    echo "Run pos-cli command: $@"
fi
