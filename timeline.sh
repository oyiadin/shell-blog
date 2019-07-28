#!/bin/bash
./header.sh

if [[ $HTTP_USER_AGENT == *"curl"* ]]; then
    bgmi history
else
    bgmi history | sed $'s/\x1b\[1;[0-9]*m//g' | sed $'s/\x1b\[0m//g'
fi
