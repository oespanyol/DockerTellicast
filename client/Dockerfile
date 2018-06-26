# Use an official Centos7 runtime as a parent image
FROM centos:7

LABEL os.version="centos.7.x86_64"
LABEL tellicast.client.version="2.14.4-2"
LABEL dockerfile.release-date="2018.0.6.22"

# ARG needed at build time
# ARG variables as ENV variables as well
ARG service
ARG username
ARG userkey
ARG maddress
ARG mname
ARG iaddress

# ENV needed at runtime
# Set ENV variables same as ARG 
ENV service=${service}

# Set the working directory to /tellicast
WORKDIR /tellicast

# Copy the current directory contents into the container at /app
ADD rpms/* rpms/
ADD scripts/* scripts/

# Install Tellicast Client package
RUN yum localinstall -y rpms/tellicast-client-2.14.4-2.i386.rpm

# Overwrite configuration depending in service
RUN /bin/bash scripts/config.sh

# Make Tellicast client web interface on port 8550 available to the world outside this container
# Terrestrial
#EXPOSE 8500/tcp

# Start the tellicast-client upon image instantation
# Use shell form expansion because exec form does not do shell expansion
ENTRYPOINT /usr/local/bin/tc-cast-client -c /etc/cast-client_${service}.ini

