FROM img_tkdovpn_base:latest

COPY build_client_csr.sh .
COPY install_client_crt.sh .

RUN chmod u+x build_client_csr.sh \
        && chmod u+x install_client_crt.sh \
        && cp /usr/share/doc/openvpn/examples/sample-config-files/client.conf /etc/openvpn/ \
        && cd /etc/openvpn/ \
        && sed -i 's/remote my-server-1 1194/remote 172.18.0.3 1194/' client.conf
