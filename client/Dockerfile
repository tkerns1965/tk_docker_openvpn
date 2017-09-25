FROM base

RUN cp /usr/share/doc/openvpn/examples/sample-config-files/client.conf /etc/openvpn/ \
        && cd /etc/openvpn/ \
        && sed -i 's/remote my-server-1 1194/remote 172.18.0.3 1194/' client.conf
        
