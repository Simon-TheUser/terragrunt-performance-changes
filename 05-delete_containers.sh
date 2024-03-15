#!/bin/bash

. versions.sh

$c images localhost/tg | grep -v IMAGE | awk '{ printf "%s:%s\n",$1,$2 }' | xargs $c rmi

$c rmi localhost/tf:${TF_VER}