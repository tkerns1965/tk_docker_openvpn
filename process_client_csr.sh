#!/bin/bash

CLIENT_NAME=$1

if [ -z "$CLIENT_NAME" ]; then
  echo "No client name specified."
  exit 1
fi

docker run --name cnt_tkdovpn_client -v vol_tkdovpn_certs:/tkdovpn/certs \
  img_tkdovpn_client ./build_client_csr.sh $CLIENT_NAME
docker commit cnt_tkdovpn_client img_tkdovpn_client_a
docker rm cnt_tkdovpn_client
docker run --name cnt_tkdovpn_server -v vol_tkdovpn_certs:/tkdovpn/certs \
  img_tkdovpn_server ./sign_client_csr.sh $CLIENT_NAME
docker run --name cnt_tkdovpn_client_a -v vol_tkdovpn_certs:/tkdovpn/certs \
  img_tkdovpn_client_a ./install_client_crt.sh $CLIENT_NAME
docker commit cnt_tkdovpn_client_a img_tkdovpn_$CLIENT_NAME
docker rm cnt_tkdovpn_client_a
