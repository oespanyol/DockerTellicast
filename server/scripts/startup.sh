#!/bin/bash
set -e

# Get the interface address of the container
ip=$(hostname -i | tail -1)

# Set the interface address 
echo "Assign interface_address=$ip"
sed -i "s#^interface_address=.*#interface_address=$ip#" /opt/tellitec/tc-cast-server/send.ini

# Start Tellicast Server
/opt/tellitec/tc-cast-server/tc-cast-server -c /opt/tellitec/tc-cast-server/send.ini

