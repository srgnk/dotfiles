#!/usr/bin/env bash

# https://github.com/chubin/wttr.in
function wttr {
   city=${1:-Gdansk} 
   options="?m"
   curl "wttr.in/$city$options"
}
