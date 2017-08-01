# Basic install of esniper 
#
# Currently installs esniper 2-33-0

FROM lsiobase/alpine
MAINTAINER BenevolentD


# install build packages 
RUN \ 
	apk add --no-cache --virtual=build-dependencies \
	g++ \
	gcc \
	php-dev \
	make && \
	curl https://kent.dl.sourceforge.net/project/esniper/esniper/2.33.0/esniper-2-33-0.tgz -o /tmp/esniper.tgz && \
	cd /tmp && tar zxf /tmp/esniper.tgz && cd /tmp/esniper-2-33-0; ./configure; make; make install && \
	mkdir -p /esniper/logs


ADD .esniper / 
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT "./entrypoint.sh"
