docker-mumble
==================

This is a Dockerfile setup for Mumble. Client for low latency VoIP chat.

Edit /config/mumble-server.ini


    docker run -d --name="Mumble" --net="host" -v "/path/to/config":"/config":rw benevolentd/docker-mumble
