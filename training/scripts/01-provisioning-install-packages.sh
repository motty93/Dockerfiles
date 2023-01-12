#!/bin/bash

set -eux

INSTALL_PACKAGES="\
	apache2 \
	language-pack-ja \
	libapache2-mod-php7.0 \
	mysql-server-5.7 \
	php7.0 \
	php7.0-mbstring \
	php7.0-mysql \
	php7.0-opcache \
	tzdata" 

export DEBIAN_FRONTEND=noninteractive

apt-get update

apt-get install -y --no-install-recommends ${INSTALL_PACKAGES}
