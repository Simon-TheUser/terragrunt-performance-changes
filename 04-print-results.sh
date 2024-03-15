#!/bin/bash

. versions.sh

# TG_VER=${TG_VERS[1]}
# Run tests
for TG_VER in "${TG_VERS_TO_TEST[@]}"; do
    cat time.tg${TG_VER}.txt
    echo
done
