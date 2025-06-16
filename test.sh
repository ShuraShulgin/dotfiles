#!/bin/sh
if [ $(timeout 30 spotify_player get key playback | jq .is_playing) = 'true' ]; then echo '#{E:th_green}'; else echo '#{E:th_orange}'; fi 
