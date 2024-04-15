#!/bin/bash

function server_up() {
    local _container_name=$(docker ps -a | awk '{print $NF}' | tail -n +2 | fzf)
    local _container_state=$(docker inspect -f '{{.State.Status}}' $_container_name)
    if [ "$_container_state" == "running" ]; then
        symfony serve --no-tls -d
    else
        echo "The container $_container_name is down"
    fi
}
