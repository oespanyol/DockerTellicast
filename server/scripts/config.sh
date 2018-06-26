#!/bin/bash
set -e

# Set the interface address 
echo "Assign interface_address=localhost"
sed -i "s#^interface_address=.*#interface_address=$iaddress#" /opt/tellitec/tc-cast-server/send.ini
# Set the multicast address for the announcement channel
echo "Assign multicast announcement address=$maddress"
sed -i "s#^address=.*#address=$maddress#" /opt/tellitec/tc-cast-server/send.ini
# Set the multicast name for the announcement channel
echo "Assign multicast announcement name=$mname"
sed -i "s#^name=.*#name=$mname#" /opt/tellitec/tc-cast-server/send.ini


