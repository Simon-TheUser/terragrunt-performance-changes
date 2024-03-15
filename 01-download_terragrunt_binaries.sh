#!/bin/bash
set -ex

. versions.sh

# Build a container for each official version of terragrunt:
for TG_VER in "${TG_VERS[@]}"; do
    wget -nv https://github.com/gruntwork-io/terragrunt/releases/download/${TG_VER}/terragrunt_linux_amd64 -O terragrunt.${TG_VER}
done