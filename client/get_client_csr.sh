#!/bin/bash

CLIENT_NAME=$1

if [ -z "$CLIENT_NAME" ]; then
  echo "No client name specified."
  exit 1
fi

cd /etc/openvpn/easy-rsa/
. ./vars
./clean-all
./build-req --batch $CLIENT_NAME
