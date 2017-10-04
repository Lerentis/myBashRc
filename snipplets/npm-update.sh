#!/bin/sh

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

for package in $(npm -g outdated --parseable --depth=0 | cut -d: -f2)
do
	echo "Updating $package ..."
    npm -g install "$package"
done
