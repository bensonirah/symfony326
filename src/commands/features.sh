#!/bin/bash

function features() {
    local _feature=$1
    if [ -n "$_feature" ]; then
        command git branch "features/feat-${_feature}" features/feat-POSUPGRADE-8
    else
        command git branch | grep features | gum choose
    fi
}
