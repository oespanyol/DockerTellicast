#!/bin/bash
set -e

# Get the IP of the container
ip=$(hostname -i | tail -1)
# Assign the IP to the client configuration file
echo "Assign interface address interface_address=$ip"
sed -i "s#^interface_address=.*#interface_address=$ip#" /etc/cast-client_${service}.ini

# Launch the Telilcast client
/usr/local/bin/tc-cast-client -c /etc/cast-client_${service}.ini

