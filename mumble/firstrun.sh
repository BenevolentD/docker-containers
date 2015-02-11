#!/bin/bash

# Check if config exists. If not, copy in the sample config
if [ -f /config/mumble-server.ini ]; then
  echo "Using existing config file."
else
  echo "Creating config from template."
  mv /etc/mumble-server.ini /config/mumble-server.ini
  chown nobody:users /config/mumble-server.ini
fi
