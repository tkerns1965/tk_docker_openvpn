#!/bin/bash

CLIENT_NAME=$1

if [ -z "$CLIENT_NAME" ]; then
  echo "No client name specified."
  exit 1
fi

cp /tkdovpn/certs/$CLIENT_NAME.csr /etc/openvpn/easy-rsa/keys/
cd /etc/openvpn/easy-rsa/
. ./vars
./sign-req --batch $CLIENT_NAME
cp ./keys/ca.crt /tkdovpn/certs/
cp ./keys/$CLIENT_NAME.crt /tkdovpn/certs/
