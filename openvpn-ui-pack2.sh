#!/bin/bash -x
# Exit immediately if a command exits with a non-zero status
set -e

# Set the home directory of the openvpn-ui project
OVPN_UI_HOME="/home/admin/build/openvpn-ui"

# Run a docker container with the specified volume and environment variable, and execute the specified command
    # Mount the host directory "/home/philipp/build/openvpn-web-ui/" to the container directory "/go/src/github.com/adamwalach/openvpn-web-ui"
    # Set the GO111MODULE environment variable to 'auto'
    # Automatically remove the container when it exits
    # Use the "local/beego-v8" image
    # Execute the command "cd /go/src/github.com/d3vilh/openvpn-ui/ && bee version && bee pack -exr='^vendor|^data.db|^build|^README.md|^docs'"
time docker run \
    -v "$OVPN_UI_HOME":/go/src/github.com/d3vilh/openvpn-ui \
    -e GO111MODULE='auto' \
    --rm \
    -w /usr/src/myapp \
    local/beego \
    sh -c "cd /go/src/github.com/d3vilh/openvpn-ui/ && bee version && bee pack -exr='^vendor|^data.db|^build|^README.md|^docs'"
