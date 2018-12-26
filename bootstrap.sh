#!/bin/bash

# Move to project folder
dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

function version { echo "$@" | awk -F. '{ printf("%d%03d%03d%03d\n", $1,$2,$3,$4); }'; }

if [ $(version "6.2.2") -ge $(version "6.2.0") ]; then
    echo "Version is up to date"
else
	echo "Not up to date"
fi
