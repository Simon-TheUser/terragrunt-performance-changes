#!/bin/bash

. versions.sh

#set -ex

TG_CMD="terragrunt graph-dependencies"

# You can also try with a run-all apply command, which will be automatically cancelled when running in a non-interactive container.
#TG_CMD=terragrunt run-all apply

# Run TG_CMD against each version of Terragrunt
for TG_VER in "${TG_VERS[@]}"; do
    echo Testing with Terragrunt version ${TG_VER} | tee time.tg${TG_VER}.txt
    $c run --rm -v "$(pwd)/iac:/iac" -v "$(pwd):/project" tg:${TG_VER} /usr/bin/time -ao /project/time.tg${TG_VER}.txt ${TG_CMD}
done
