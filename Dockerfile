FROM lsiobase/mono:LTS

# set environment variables
ARG DEBIAN_FRONTEND="noninteractive"

ENV PATH="/opt/screenconnect/App_Runtime/bin:${PATH}" \
MONO_PATH="/opt/screenconnect/App_Runtime/lib" \
MONO_CFG_DIR="/opt/screenconnect/App_Runtime/etc" \
XDG_CONFIG_HOME="/opt/screenconnect/App_Runtime/etc" \
MONO_XMLSERIALIZER_THS=no

RUN \
if [ ! -f "/opt/screenconnect/web.config" ]; then \
 echo "**** Downloading ScreenConnect ****";  \
 curl -o \
	/tmp/ScreenConnect_Release.tar.gz -L \
	"https://www.screenconnect.com/Download?Action=DownloadLatest&Platform=Linux&PreRelease=false"; \
 echo "**** Extracting ScreenConnect ****"; \
 tar xf \
	/tmp/ScreenConnect_Release.tar.gz -C \
	/tmp --strip-components=1; \
 echo "**** Installing ScreenConnect ****"; \
 echo -e "\n\n" | /tmp/install.sh; \
fi && \
 echo "**** cleanup ****" && \
 apt-get clean && \
 rm -rf \
	/tmp/* \
	/var/tmp/*

# add local files
COPY root/ /

# ports and volumes
EXPOSE 8040 8041
VOLUME /opt/screenconnect
