

show_spotify_status() {
  local index icon color text module
  index=$1

  jsonData="$( spotify_player get key playback )"
  artist="$( echo "$jsonData" | jq .item.artists[0].name)"
  title="$( echo "$jsonData" | jq .item.name)"
  duration="$( echo "$jsonData" | jq .item.duration_ms)"
  progress="$( echo "$jsonData" | jq .item.progress_ms)"
  playing="$( echo "$jsonData" | jq .is_playing)"
  color="$( get_tmux_option "@catppuccin_spotify_status_color" "#([[ \$(timeout 30 spotify_player get key playback | jq .is_playing) = 'true' ]] && echo '$thm_green' || echo '$thm_orange')" )"
  icon="$( get_tmux_option "@catppuccin_spotify_status_icon", " #([[ \$(timeout 30 spotify_player get key playback | jq .is_playing) = 'true' ]] && echo '' || echo '')" )"
  text="$( get_tmux_option "@catppuccin_spotify_status_text"  "#( timeout 30 spotify_player get key playback | jq -r .item.name )" )"
  module="$( build_status_module "$index" "$icon" "$color" "$text" )"
  echo "$module"
}
