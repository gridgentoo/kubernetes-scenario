#!/bin/sh

launch.sh

source <(kubectl completion bash)
source <(helm completion bash)

mkdir dev
cd dev

# Insure tree is available, not all Katacoda instance have it consistently available.
apt update && apt install tree

{ clear && echo 'Kubernetes is ready.'; } 2> /dev/null