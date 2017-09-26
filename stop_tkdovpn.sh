#!/bin/bash

CLIENT_NAME=$1

if [ -z "$CLIENT_NAME" ]; then
  echo "No client name specified."
  exit 1
fi

docker stop cnt_tkdovpn_server1
docker rm cnt_tkdovpn_server1
docker stop cnt_tkdovpn_$CLIENT_NAME
docker rm cnt_tkdovpn_$CLIENT_NAME
