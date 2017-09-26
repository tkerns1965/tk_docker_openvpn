#!/bin/bash

CLIENT_NAME=$1

if [ -z "$CLIENT_NAME" ]; then
  echo "No client name specified."
  exit 1
fi

cd /tkdovpn/certs/
# chown 0:0 ca.crt
# chown 0:0 $CLIENT_NAME.crt
cp ca.crt /etc/openvpn/easy-rsa/keys/
cp $CLIENT_NAME.crt /etc/openvpn/easy-rsa/keys/

cd /etc/openvpn/easy-rsa/keys/
cp ca.crt /etc/openvpn/
cp $CLIENT_NAME.crt /etc/openvpn/
cp $CLIENT_NAME.key /etc/openvpn/

cd /etc/openvpn/
mv $CLIENT_NAME.crt client.crt
mv $CLIENT_NAME.key client.key
