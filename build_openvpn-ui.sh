#!/bin/bash -ex
# Exit immediately if a command exits with a non-zero status
set -e

# Set the home directory of the openvpn-ui project
OVPN_UI_HOME="/home/admin/build/openvpn-ui"

# Set the current directory
OD=$PWD

# go to script folder, required for below steps
CURDIR=${OD}/$(dirname $0)
cd "${CURDIR}"
# Build golang & bee environment
docker build --platform="linux/amd64" -f Dockerfile-beego -t local/beego -t local/beego:latest .
./openvpn-ui-pack2.sh

# Build OpenVPN-UI image
PKGFILE=$OVPN_UI_HOME"/openvpn-ui.tar.gz"
cp -f $PKGFILE ./

docker build -t local/openvpn-ui .
rm -f $PKGFILE; rm -f $(basename $PKGFILE)
