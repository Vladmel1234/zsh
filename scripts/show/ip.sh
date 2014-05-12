#!/bin/bash

# Description  :
# Usage        :
# Dependencies :
# Example      :
# Notes        :

curl -s 'http://checkip.dyndns.com/' | sed 's/[^0-9\.]//g'