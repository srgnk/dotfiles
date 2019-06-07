#!/usr/bin/env bash

# https://github.com/chubin/wttr.in
function wttr {
   city=${1:-Gdansk} 
   options="?m"
   curl "wttr.in/$city$options"
}

# https://github.com/chubin/cheat.sh
function cheat {
   curl "cheat.sh/$1?style=solarized-dark"
}

function tarbz2 {
    [[ -z "$1" ]] && echo "${FUNCNAME[0]}: <arg>" && return 1

    archive_name="$(basename $1).tar.bz2"
    tar -cjvf "$archive_name" "$1"
}

function targz {
    [[ -z "$1" ]] && echo "${FUNCNAME[0]}: <arg>" && return 1

    archive_name="$(basename $1).tar.gz"
    tar -czvf "$archive_name" "$1"
}
