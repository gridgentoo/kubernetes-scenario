#!/bin/sh

launch.sh
apt install tree
source <(kubectl completion bash)

{ clear && echo 'Kubernetes is ready.'; } 2> /dev/null