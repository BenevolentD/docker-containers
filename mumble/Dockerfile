FROM phusion/baseimage:0.9.15
MAINTAINER BenevolentD

# Set correct environment variables
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Configure user nobody to match unRAID's settings
 RUN \
 usermod -u 99 nobody && \
 usermod -g 100 nobody && \
 usermod -d /home nobody && \
 chown -R nobody:users /home

# Disable SSH
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh

# Install mumble
RUN \
  add-apt-repository ppa:mumble/release && \
  apt-get update -q && \
  apt-get install -qy mumble-server && \
  apt-get clean -y && \
  rm -rf /var/lib/apt/lists/* && \
  
# Expose Ports
EXPOSE 64738/tcp 64738/udp

# Expose Volumes
VOLUME /config

# Add firstrun.sh to execute during container startup
ADD firstrun.sh /etc/my_init.d/firstrun.sh
RUN chmod +x /etc/my_init.d/firstrun.sh

# Add ddclient to runit
#RUN mkdir /etc/service/ddclient
#ADD ddclient.sh /etc/service/ddclient/run
#RUN chmod +x /etc/service/ddclient/run
