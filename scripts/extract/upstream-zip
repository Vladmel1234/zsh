#!/bin/bash

# Description  : Download & Extract a zip from a url.
# Usage        : extract upstream-zip <URL> <Dest>
# Dependencies : bsdtar
# Example      : extract upstream-zip https://wordpress.org/latest.zip ~/Downloads
# Notes        :

URL=$1
DEST=$2

wget -qO- $URL | bsdtar -xvf- -C $DEST