#!/bin/sh

# Description  : Finds commits that introduced or removed a given string.
# Usage        :
# Dependencies :
# Example      :
# Notes        : Prints the file name, commit and line number. File is optional.

QUERY=$1
FILE=$2

git grep -n "$QUERY" $(git log -g --pretty=format:%h -S"$QUERY") $FILE