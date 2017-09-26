#!/bin/bash

CLIENT_NAME=$1

if [ -z "$CLIENT_NAME" ]; then
  echo "No client name specified."
  exit 1
fi

docker run -d img_tkdovpn_server1
docker run img_tkdovpn_$CLIENT_NAME
