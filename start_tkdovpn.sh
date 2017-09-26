#!/bin/bash

CLIENT_NAME=$1

if [ -z "$CLIENT_NAME" ]; then
  echo "No client name specified."
  exit 1
fi

docker run --name cnt_tkdovpn_server1 -d -p 1194:1194/udp --cap-add=NET_ADMIN --device=/dev/net/tun img_tkdovpn_server1
# docker run --name cnt_tkdovpn_server1 -d -p 1194:1194/udp --privileged img_tkdovpn_server1
# docker run img_tkdovpn_$CLIENT_NAME
