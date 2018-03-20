FROM alpine:latest
MAINTAINER BenevolentD "github.com/BenevolentD"
RUN ["/sbin/apk.static", "add", "--no-cache", "alpine-base", "pwgen", "xvfb", "wine", "linux-pam", "wget", "ca-certificates"]
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub && \
    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.27-r0/glibc-2.27-r0.apk && \
    apk.static add glibc-2.27-r0.apk && \
	wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.27-r0/glibc-bin-2.27-r0.apk && \
    apk.static add glibc-bin-2.27-r0.apk && \



    /usr/glibc/usr/bin/ldconfig /lib /usr/glibc/usr/lib && \
    #rm -rf /var/cache/apk/* && \
    wget --no-check-certificate https://bintray.com/tigervnc/stable/download_file?file_path=tigervnc-1.8.0.x86_64.tar.gz && tar zxf tigervnc-1.8.0.x86_64.tar.gz ./usr -C / && rm tigervnc-1.8.0.x86_64.tar.gz && \
    wget --no-check-certificate http://winetricks.org/winetricks && chmod +x winetricks && mv winetricks /usr/bin/winetricks && \
    adduser -D -s /bin/bash winer
USER winer



COPY rootfs/ /
winetricks win7 msxml3 dotnet45 vcrun2010
CMD ["/usr/local/bin/startwine.sh"]