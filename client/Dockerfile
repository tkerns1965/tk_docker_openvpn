FROM ubuntu:16.04

RUN apt update \
        && apt install openvpn easy-rsa -y \
        && cp -r /usr/share/easy-rsa/ /etc/openvpn/ \
        && cd /etc/openvpn/easy-rsa/ \
        && sed -i 's/export KEY_PROVINCE="CA"/export KEY_PROVINCE="MD"/' vars \
        && sed -i 's/export KEY_CITY="SanFrancisco"/export KEY_CITY="Hagerstown"/' vars \
        && sed -i 's/export KEY_ORG="Fort-Funston"/export KEY_ORG="C_William_Hetzer_Inc"/' vars \
        && sed -i 's/export KEY_EMAIL="me@myhost.mydomain"/export KEY_EMAIL="tkerns@cwilliwmhetzer.com"/' vars \
        && sed -i 's/export KEY_OU="MyOrganizationalUnit"/export KEY_OU="CWHvpn"/' vars \
        && sed -i 's/export KEY_NAME="EasyRSA"/export KEY_NAME="CWHvpn"/' vars \
        && . ./vars \
        && ./clean-all \
        && ./build-req --batch client1

# ENTRYPOINT ["openvpn", "--cd", "/etc/openvpn/", "--config", "server.conf"]
