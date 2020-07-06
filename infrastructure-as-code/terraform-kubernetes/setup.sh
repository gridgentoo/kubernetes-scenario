#!/bin/sh

# Install terraform
TERRAFORM_VERSION=0.12.18
wget -O /tmp/terraform.zip "https://releases.hashicorp.com/terraform/$TERRAFORM_VERSION/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
unzip -d /tmp /tmp/terraform.zip
mv /tmp/terraform /usr/local/bin
