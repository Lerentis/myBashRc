#!/bin/bash
(
    set -o xtrace
    echo ""
    echo "$1" | perl -ne '/^(ssh):\/\/([^:@]*)?:?([^:@]*)?[:@]?([^:@\/\?\#]*)/ && print "$1\n"; print "$2\n"; print "$3\n"; print "$4\n"'
    echo ""
    # 1 2 3 4 5 6 7 8 9
    #user=$(echo "$1"|perl -ne '/ssh:\/\/([^:@]*)@?(\w+.[a-z]{2,3}):?(\d*)/ && print $1')
    #[ -z "$user" ] && user=$USER
    host=$(echo "$1"|perl -ne '/ssh:\/\/(\w+.[a-z]{2,3}):?(\d*)/ && print $1')
    port=$(echo "$1"|perl -ne '/:(\d+)$/ && print $1')
    [ -z "$port" ] && port="22"

	tilix -e "ssh -p $port $host"
    #roxterm --separate --title="SSH $1" --execute ssh -p $port $user@$host

) >> /tmp/exo.log 2>&1