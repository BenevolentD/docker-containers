#!/bin/bash

if [ ! -f /config/mumble-server.ini ]
then
  sed -i 's/var.log.mumble-server/data/' /etc/mumble-server.ini
  sed -i 's/var.lib.mumble-server/data/' /etc/mumble-server.ini
  sed -i 's/^INIFILE=.*/INIFILE=\/config\/mumble-server.ini/' /etc/init.d/mumble-server
  cp /etc/mumble-server.ini /config
  chmod a+rw /config/mumble-server.ini
  echo Created /config/mumble-server.ini. Exiting.
  exit 1
fi

echo Starting mumble-server service
sed -i 's/^INIFILE=.*/INIFILE=\/config\/mumble-server.ini/' /etc/init.d/mumble-server
service mumble-server start

while true
do
  sleep 3600
done