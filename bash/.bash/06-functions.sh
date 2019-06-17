#!/usr/bin/env bash

# https://github.com/chubin/wttr.in
function wttr {
   local city=${1:-Gdansk}
   local options="?m"
   curl "wttr.in/$city$options"
}

# https://github.com/chubin/cheat.sh
function cheat {
   curl "cheat.sh/$1?style=solarized-dark"
}

function tarbz2 {
    [[ -z "$1" ]] && echo "${FUNCNAME[0]}: <arg>" && return 1

    local archive_name="$(basename $1).tar.bz2"
    tar -cjvf "$archive_name" "$1"
}

function targz {
    [[ -z "$1" ]] && echo "${FUNCNAME[0]}: <arg>" && return 1

    local archive_name="$(basename $1).tar.gz"
    tar -czvf "$archive_name" "$1"
}

function bak {
    [[ -z "$1" ]] && echo "${FUNCNAME[0]}: <arg>" && return 1

    cp "$1" "$1".bak
}

function unbak {
    [[ -z "$1" ]] && echo "${FUNCNAME[0]}: <arg>" && return 1

    local file="$1"
    local ext="${file##*.}"
    local orig="${file%.*}"

    [[ "$ext" != 'bak' ]] && echo "$file does not have .bak extension" && return 1
    [[ "$orig" == '..' ]] && echo "Input file cannot be $file" && return 1
    [[ "$orig" == '.' ]] && echo "Input file cannot be $file" && return 1
    [[ "$orig" == '' ]] && echo "Input file cannot be $file" && return 1

    mv "$file" "$orig"
}

# speed up copying of folders with many small files
function scptar_get {
    [[ -z "$1" ]] && echo "${FUNCNAME[0]}: <host> <path_to_file>" && return 1

    local host="$1"
    local file="$2"

    ssh $host "tar -cf - $file" | tar -xvf -
}
