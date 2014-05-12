#!/bin/bash

# Description  : Copy SSH Public Key to clipboard
# Usage        : clp ssh
# Dependencies : clp(), xclip
# Example      :
# Notes        :

cat "~/.ssh/id_rsa.pub" | clip