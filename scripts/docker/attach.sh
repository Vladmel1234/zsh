#!/bin/bash

# Description  : Better docker attach using nsenter.
# Usage        : docker attach <container-name>
# Dependencies : nsenter, docker
# Example      : docker attach nginx
# Notes        : Can be either container name, ID or whatever.
# Source       : http://www.sebastien-han.fr/blog/2014/01/27/access-a-container-without-ssh
# Source       : http://www.colliernotes.com/2014/03/how-to-enter-docker-container-without.html

if which nsenter > /dev/null 2>&1; then
  echo 'Nsenter Installed.'
else
  sudo apt-get build-dep util-linux
  wget -qO- "https://www.kernel.org/pub/linux/utils/util-linux/v2.24/util-linux-2.24.tar.bz2" | tar -jxf- -C /usr/local/src
  mv /usr/local/src/util-linux-2.24 /usr/local/src/util-linux && cd /usr/local/src/util-linux
  sudo ./configure --without-ncurses && sudo make && sudo make install
fi

CONTAINER=$1
PID=`docker inspect --format '{{ .State.Pid }}' $CONTAINER`
sudo nsenter -m -u -n -i -p -t $PID /bin/bash