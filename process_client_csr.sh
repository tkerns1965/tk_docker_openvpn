#!/bin/bash

CLIENT_NAME=$1

if [ -z "$CLIENT_NAME" ]; then
  echo "No client name specified."
  exit 1
fi

docker run -v vol_tkdovpn_certs:/tkdovpn/certs img_tkdovpn_client ./build_client_csr.sh $CLIENT_NAME
# docker run -v vol_tkdovpn_certs:/tkdovpn/certs img_tkdovpn_server ./sign_client_csr.sh $CLIENT_NAME
# docker run -v vol_tkdovpn_certs:/tkdovpn/certs img_tkdovpn_client ./install_client_crt.sh $CLIENT_NAME
# docker commit img_tkdovpn_client img_tkdovpn_$CLIENT_NAME
