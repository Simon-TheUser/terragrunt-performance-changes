#!/bin/bash

. versions.sh

# TG_VER=${TG_VERS[1]}
# Run tests
for TG_VER in "${TG_VERS[@]}"; do
    $c rmi localhost/tg:${TG_VER}
    echo
done

$c rmi localhost/tf:${TF_VER}