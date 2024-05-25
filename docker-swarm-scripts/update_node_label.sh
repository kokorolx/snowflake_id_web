#!/bin/bash

# Check if root privileges are required for Docker commands
if [[ $(id -u) -ne 0 ]]; then
  echo "Please run this script with sudo or as root user."
  exit 1
fi

# Get a list of all node IDs
node_ids=$(docker node ls --quiet)

# Specify the label name and base value
label_name="DATACENTER_ID"

# Update the label for each node with a dynamic value
counter=1
for node_id in $node_ids; do
  label_value="$counter"
  docker node update $node_id --label-add "$label_name=$label_value"
  echo "Updated label $label_name to $label_value for node $node_id"
  counter=$((counter + 1))
done
