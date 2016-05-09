#!/bin/bash

function getip() { (traceroute $1 2>&1 | head -n 1 | cut -d\( -f 2 | cut -d\) -f 1) }

IP_ADDRESS=$(getip $1)
echo $IP_ADDRESS
echo $TOKEN

docker-machine -D create -d generic \
  --engine-storage-driver=overlay --swarm --swarm-master \
  --swarm-image hypriot/rpi-swarm:1.2.1 \
  --swarm-discovery="token://$TOKEN" \
  --generic-ip-address=$(getip $1) \
  $1
