docker-mumble
==================

This is a Dockerfile setup for Mumble specifically geared toward unraid.

Edit /config/mumble-server.ini


    docker run -d --name="Mumble" --net="host" -v "/path/to/config":"/config":rw brentwood/docker-mumble
