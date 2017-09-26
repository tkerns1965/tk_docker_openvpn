FROM base

COPY sign_client_csr.sh .

RUN chmod u+x sign_client_csr.sh \
        && cp /usr/share/doc/openvpn/examples/sample-config-files/server.conf.gz /etc/openvpn/ \
        && gzip -d /etc/openvpn/server.conf.gz \
        && sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/' /etc/sysctl.conf \
        && sysctl -p /etc/sysctl.conf \
        && cd /etc/openvpn/easy-rsa/ \
        && . ./vars \
        && ./clean-all \
        && ./build-ca --batch \
        && ./build-key-server --batch server \
        && ./build-dh \
        && cd ./keys/ \
        && cp ca.crt dh2048.pem server.crt server.key /etc/openvpn/

EXPOSE 1194/udp

ENTRYPOINT ["openvpn", "--cd", "/etc/openvpn/", "--config", "server.conf"]
