#!/bin/bash
set -e

# Set up dummy users if they don't exist
if [ -z "$USERNAME" ] && [ -z "$userkey" ]; then
   echo "No user_name and no user_key provided"
   username="TESTUSER"
   userkey="TESTKEY"
else
   echo "user_name and user_key provided"
fi

# Special configuration for each service
if [ "$service" = 'ter-1' ] || [ "$service" = 'bas' ]; then
   echo "Configuring as ${service} Service"
   echo "Set up service"
   sed -i "s#^INSTANCE_START_ORDER=bas#INSTANCE_START_ORDER=${service}#" /etc/tellicast-client.cfg
   echo "Assign user_name=$username"
   sed -i "s#^user_name=#user_name=$username#" /etc/cast-client_${service}.ini
   echo "Assign user_key=$userkey"
   sed -i "s#^user_key=#user_key=$userkey#" /etc/cast-client_${service}.ini
   echo "Assign multicast announcement address=$maddress"
   sed -i "s#^address=.*#address=$maddress#" /etc/cast-client_${service}.ini
   echo "Assign multicast announcement name=$mname"
   sed -i "s#^name=.*#name=$mname#" /etc/cast-client_${service}.ini

else
   echo "No specific configuration"
fi

