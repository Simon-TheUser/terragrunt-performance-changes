#!/bin/bash
set -xe

. versions.sh



# Build a temporary container with Terraform:
$c build . -f Dockerfile.tf --build-arg TF_VER=${TF_VER} -t localhost/tf:${TF_VER}


# Build a container for each version of terragrunt:
for TG_VER in "${TG_VERS[@]}"; do
    $c build . -f Dockerfile.tg --build-arg TG_VER=${TG_VER} -t localhost/tg:${TG_VER}
done