# Define the path to the script
set -g @special_char_script '~/.tmux/plugins/tmux-special-window-tags/get_special_character.sh'

# Function to get the special character for a window
get_special_char() {
  local window_number=$1
  # Use the script to get the special character
  local special_char=$($(@special_char_script) $window_number)
  echo $special_char
}

# Set the window status format
set -g status-left ''
set -g status-right ''
set -g window-status-format "#(get_special_char #{window_index}) #W#{?#{window_flags},#{window_flags}, }"
set -g window-status-current-format "#(get_special_char #{window_index}) #W#{?#{window_flags},#{window_flags}, }"
