#!/bin/bash

docker cp cnt_tkdovpn_client:/etc/openvpn/easy-rsa/keys/client1.csr .
docker cp client1.csr cnt_tkdovpn_client:/etc/openvpn/easy-rsa/keys/
