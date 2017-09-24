FROM base

RUN cd /etc/openvpn/easy-rsa/ \
        && . ./vars \
        && ./clean-all \
        && ./build-req --batch client1 \
        && cd / \
        && cp /usr/share/doc/openvpn/examples/sample-config-files/client.conf /etc/openvpn/ \
        && sed -i 's/remote my-server-1 1194/remote 172.18.0.3 1194/' /etc/openvpn/client.conf \

# ENTRYPOINT ["openvpn", "--cd", "/etc/openvpn/", "--config", "server.conf"]

# apt install iputils-ping
# apt install net-tools
# apt install dnsutils
