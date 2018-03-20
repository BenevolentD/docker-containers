## docker-jottacloud

This is a Container for the official Jottacloud Windows Client based on [solarkennedy/wine-x11-novnc-docker
](https://github.com/solarkennedy/wine-x11-novnc-docker)

This container runs:

* Xvfb - X11 in a virtual framebuffer
* x11vnc - A VNC server that scrapes the above X11 server
* [noNVC](https://kanaka.github.io/noVNC/) - A HTML5 canvas vnc viewer
* Fluxbox - a small window manager
* WINE - to run Windows executables on linux
* setup.exe/Jotta.exe - official Windows Jottacloud client

```
docker run -d \
  --name="Jottacloud" \
  -p novnc-port:8080 \
  -p vnc-port:5900 \
  -v /path/to/sync/:/root/prefix32/drive_c/users/root/Jottacloud:rw \
  rix1337/docker-jottacloud
  ```
# Known Issues:

Attempting to access the host volume will crash jotta.exe (and others). That's why the app stops after logging in.
A fix for this is needed to sync.
