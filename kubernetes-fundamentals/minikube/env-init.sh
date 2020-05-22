#!/bin/sh

source <(helm completion bash)
source <(minikube completion bash)

minikube addons enable metrics-server
clear
