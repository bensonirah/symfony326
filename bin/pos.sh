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
    # Import all command from pos workspace
    for _cmd in $(find $POS_COMMAND -type f -iname "*.sh"); do
        . $_cmd
    done

    # Extract the base command
    _command=$1
    shift 1

   # Run command
   "$_command" $@
fi
