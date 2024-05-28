#!/bin/bash

# Check if root privileges are required for Docker commands
if [[ $(id -u) -ne 0 ]]; then
  echo "Please run this script with sudo or as root user."
  exit 1
fi

# DATA_CENTER = ['sudox-01', 'azure-01', 'aws-01']
# Specify the label name and base value
label_name="DATACENTER_ID"

docker node update sudox-01 --label-add "$label_name=0";
docker node update azure-01 --label-add "$label_name=1";
docker node update aws-01 --label-add "$label_name=2";

# ELK stack
docker node update aws-01 --label-add logging_e=true;
docker node update sudox-01 --label-add logging_l=true;
docker node update azure-01 --label-add logging_k=true;

# Database
docker node update azure-01 --label-add database=true;

# web server
# docker node update azure-01 --label-add web=true;
