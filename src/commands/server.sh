#!/bin/bash

# import server handlers script from handlers/server folder

for _handler in $(find $POS_HANDLER/server -type f -iname "*.sh"); do
    . $_handler
done

function server() {
    local _subcommand=$1
    shift 1
    "server_$_subcommand" $@
}
