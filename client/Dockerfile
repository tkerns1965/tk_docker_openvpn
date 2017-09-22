FROM ubuntu:16.04

RUN apt update \
        && apt install openvpn easy-rsa -y \
        && cp -r /usr/share/easy-rsa/ /etc/openvpn/ \
        && cd /etc/openvpn/easy-rsa/

# ENTRYPOINT ["openvpn", "--cd", "/etc/openvpn/", "--config", "server.conf"]
