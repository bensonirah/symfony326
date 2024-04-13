#!/bin/bash

set -fe

# Import all command from pos workspace
for _cmd in $(find $POS_COMMAND -type f -iname "*.sh"); do
    . $_cmd
done

if [ $# -lt 1 ]; then
    help $@
else
    # Extract the base command
    _command=$1
    shift 1

    # Run command
    if type "$_command" &>/dev/null; then
        "$_command" $@
    else
        help $@
    fi
fi
