#!/bin/bash

docker cp cnt_tkdovpn_client:/etc/openvpn/easy-rsa/keys/client1.csr .
docker cp client1.csr cnt_tkdovpn_server:/etc/openvpn/easy-rsa/keys/
docker exec cnt_tkdovpn_server bash \
        -c "chown 0:0 /etc/openvpn/easy-rsa/keys/client1.csr \
        && cd /etc/openvpn/easy-rsa/ \
        && source ./vars \
        && ./sign-req --batch client1"
docker cp cnt_tkdovpn_server:/etc/openvpn/easy-rsa/keys/ca.crt .
docker cp cnt_tkdovpn_server:/etc/openvpn/easy-rsa/keys/client1.crt .
docker cp ca.crt cnt_tkdovpn_client:/etc/openvpn/easy-rsa/keys/
docker cp client1.crt cnt_tkdovpn_client:/etc/openvpn/easy-rsa/keys/
docker exec cnt_tkdovpn_client bash \
        -c "chown 0:0 /etc/openvpn/easy-rsa/keys/ca.crt \
        && chown 0:0 /etc/openvpn/easy-rsa/keys/client1.crt \
        && cd /etc/openvpn/easy-rsa/keys/ \
        && cp ca.crt client1.crt client1.key /etc/openvpn/ \
        && cd /etc/openvpn/ \
        && mv client1.crt client.crt \
        && mv client1.key client.key \
        && cd / \
        && openvpn --cd /etc/openvpn/ --config client.conf"
