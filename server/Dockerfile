# Use an official Centos7 runtime as a parent image
FROM centos:7

LABEL os.version="centos.7.x86_64"
LABEL tellicast.server.version="1.4.4-1"
LABEL dockerfile.release-date="2018.0.6.25"

ARG service
ARG maddress
ARG mname
ARG iaddress

# Define environment variable
#ENV SERVICE "${SERVICE}"

# Set the working directory to /tellicast
WORKDIR /tellicast

# Copy the current directory contents into the container at /app
ADD rpms/* rpms/
ADD scripts/* scripts/

# Install Tellicast Server package
RUN yum localinstall -y rpms/tellitec-tc-cast-server-1.4.4-1.x86_64.rpm

# Overwrite configuration depending in service
RUN /bin/bash scripts/config.sh

# Make Tellicast Server web interface on port 10100 available to the world outside this container
# Terrestrial
EXPOSE 10100/tcp

# Start the tellicast-server upon image instantation
# Use shell form expansion because exec form does not do shell expansion
ENTRYPOINT /opt/tellitec/tc-cast-server/tc-cast-server -c /opt/tellitec/tc-cast-server/send.ini

