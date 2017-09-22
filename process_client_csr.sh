#!/bin/bash

docker cp cnt_tkdovpn_client:/etc/openvpn/easy-rsa/keys/client1.csr .
docker cp client1.csr cnt_tkdovpn_server:/etc/openvpn/easy-rsa/keys/
docker exec cnt_tkdovpn_server bash -c "cd /etc/openvpn/easy-rsa/ \
        && source ./vars \
        && ./sign-req --batch client1"
docker cp cnt_tkdovpn_server:/etc/openvpn/easy-rsa/keys/client1.crt .
docker cp client1.crt cnt_tkdovpn_client:/etc/openvpn/easy-rsa/keys/
