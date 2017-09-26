#!/bin/bash

CLIENT_NAME=$1

if [ -z "$CLIENT_NAME" ]; then
  echo "No client name specified."
  exit 1
fi

docker run img_tkdovpn_server
docker run img_tkdovpn_$CLIENT_NAME
