#!/bin/bash

# Description  : Easy docker ssh using netcat.
# Usage        : docker ssh root@<container-name>.docker
# Dependencies : sharutils (netcat), openssh-server enabled in container
# Example      : docker ssh root@nginx.docker
# Notes        : Must be container name. Probably(?).
# Source       : https://github.com/henrik-muehe/docker-ssh

if which netcat > /dev/null 2>&1; then
  echo 'Netcat Installed.'
else
  sudo apt-get install -y sharutils
  curl -s https://raw.github.com/henrik-muehe/docker-ssh/master/install | /bin/bash
fi

CONTAINER=$1
ssh root@$1.docker