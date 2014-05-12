#!/bin/bash

# Description  :
# Usage        :
# Dependencies :
# Example      :
# Notes        :

ssh '$1' SUDO_ASKPASS=/usr/lib/ssh/ssh-askpass sudo -A '$2'