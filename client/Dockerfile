FROM ubuntu:16.04

RUN apt update \
        && apt install openvpn easy-rsa -y

ENTRYPOINT ["openvpn", "--cd", "/etc/openvpn/", "--config", "server.conf"]
