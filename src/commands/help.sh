#!/bin/bash

function help_features() {
    figlet "pos-cli"
    glow $POS_HOME/docs/features.md
}
function help_server() {
    figlet "pos-cli"
    glow $POS_HOME/docs/server.md
}

function help() {
    local _subcmd=$1
    if [ -n "$_subcmd" ]; then
        if type "help_$_subcmd" &>/dev/null; then
            "help_$_subcmd"
        else
            echo "Command $_subcmd not found"
            figlet "pos-cli"
            glow $POS_HOME/docs/help.md
            exit 1
        fi
    else
        figlet "pos-cli"
        glow $POS_HOME/docs/help.md
    fi
}
