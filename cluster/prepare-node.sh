#!/bin/bash

function getip() { (traceroute $1 2>&1 | head -n 1 | cut -d\( -f 2 | cut -d\) -f 1) }

IP_ADDRESS=$(getip $1)
#echo $IP_ADDRESS

ssh-keygen -R $IP_ADDRESS
ssh-copy-id -oStrictHostKeyChecking=no -oCheckHostIP=no root@$IP_ADDRESS

ssh root@$IP_ADDRESS sed -i \'s/ID=raspbian/ID=debian/g\' /etc/os-release
