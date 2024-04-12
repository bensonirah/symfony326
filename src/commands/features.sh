#!/bin/bash

function features() {
    local args=$1
    command git branch | gum choose
}
