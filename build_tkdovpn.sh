#!/bin/bash

docker volume create vol_tkdovpn_certs
docker build -f ./base/Dockerfile -t img_tkdovpn_base .
docker build -f ./server/Dockerfile -t img_tkdovpn_server .
docker build -f ./client/Dockerfile -t img_tkdovpn_client .
