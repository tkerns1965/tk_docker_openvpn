#!/bin/bash

CLIENT_NAME=$1

if [ -z "$CLIENT_NAME" ]; then
  echo "No client name specified."
  exit 1
fi

docker run --name cnt_tkdovpn_client_tmp -v vol_tkdovpn_certs:/tkdovpn/certs \
  img_tkdovpn_client ./build_client_csr.sh $CLIENT_NAME
docker commit cnt_tkdovpn_client_tmp img_tkdovpn_client_tmp
docker rm cnt_tkdovpn_client_tmp

docker run --name cnt_tkdovpn_server_tmp -v vol_tkdovpn_certs:/tkdovpn/certs \
  img_tkdovpn_server ./sign_client_csr.sh $CLIENT_NAME
docker commit -c 'ENTRYPOINT ["openvpn", "--cd", "/etc/openvpn/", "--config", "server.conf"]' \
  -c 'EXPOSE 1194/udp' cnt_tkdovpn_server_tmp img_tkdovpn_server1
docker rm cnt_tkdovpn_server_tmp

docker run --name cnt_tkdovpn_client_tmp -v vol_tkdovpn_certs:/tkdovpn/certs \
  img_tkdovpn_client_tmp ./install_client_crt.sh $CLIENT_NAME
docker commit -c 'ENTRYPOINT ["openvpn", "--cd", "/etc/openvpn/", "--config", "client.conf"]' \
  cnt_tkdovpn_client_tmp img_tkdovpn_$CLIENT_NAME
docker rm cnt_tkdovpn_client_tmp
docker rmi img_tkdovpn_client_tmp
