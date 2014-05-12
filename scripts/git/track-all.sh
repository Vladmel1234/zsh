#!/bin/sh

# Description  :
# Usage        :
# Dependencies :
# Example      :
# Notes        :

for remote in `git branch -r `; do git branch --track $remote; done