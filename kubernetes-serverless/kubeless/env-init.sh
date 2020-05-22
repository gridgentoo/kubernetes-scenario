#!/bin/sh

launch.sh

# Helm Setup
# TODO - Helm chart appears not to be compatible with Helm V3, so this is still using Helm V2
helm init

source <(kubectl completion bash)
source <(helm completion bash)

{ clear && echo 'Kubernetes with Helm is ready.'; } 2> /dev/null
