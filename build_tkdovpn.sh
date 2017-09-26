#!/bin/bash

docker volume create vol_tkdovpn_certs
cd ./base/
docker build -t img_tkdovpn_base .
cd ../server/
docker build -t img_tkdovpn_server .
cd ../client/
docker build -t img_tkdovpn_client .
cd ../
