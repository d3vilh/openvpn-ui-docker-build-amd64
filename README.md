# openvpn-ui-docker-build
Scripts simplifying build of [openvpn-ui](https://github.com/d3vilh/openvpn-ui) for AMDx64 arch compatible with AWS EC2 Debian instance.

## To build the image
To build own image you need to set local path to [openvpn-ui](https://github.com/d3vilh/openvpn-ui ) sources into OVPN_UI_HOME var in the [build_openvpn-ui.sh](https://github.com/d3vilh/openvpn-ui-docker-build-amd64/blob/master/build_openvpn-ui.sh) and [openvpn-ui-pack2.sh](https://github.com/d3vilh/openvpn-ui-docker-build-amd64/blob/master/openvpn-ui-pack2.sh) files. For example:

```
# Set the home directory of the openvpn-ui project
OVPN_UI_HOME="/home/admin/build/openvpn-ui"
```

Then run `build_openvpn-ui.sh` to build the image. The image will be named `openvpn-ui:amd64`.

## To run the image
```
docker run \
-v /home/philipp/openvpn:/etc/openvpn \
-v /home/philipp/openvpn/db:/opt/openvpn-gui/db \
-v /home/philipp/openvpn/pki:/usr/share/easy-rsa/pki \
-v /var/run/docker.sock:/var/run/docker.sock \
-e OPENVPN_ADMIN_USERNAME='admin' \
-e OPENVPN_ADMIN_PASSWORD='gagaZush' \
-p 8080:8080/tcp \
--privileged local/openvpn-ui 
```