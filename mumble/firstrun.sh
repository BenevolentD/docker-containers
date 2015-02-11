#!/bin/bash

# Check if config exists. If not, copy in the sample config
if [ -f /config/mumble-server.ini ]; then
  echo "Using existing config file."
  rm /etc/mumble-server.ini
  ln -s /config/mumble-server.ini /etc/mumble-server.ini
else
  echo "Using default config file."
  ln -s /etc/mumble-server.ini /config/mumble-server.ini
  chown nobody:users /config/mumble-server.ini
fi
