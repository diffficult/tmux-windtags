#!/bin/bash

# This script echoes a special character based on the tmux window number from where it's running.

# Array of special characters
special_characters=('🏠' '🌟' '🔥' '🚀' '💡' '🔧' '🎉' '📚' '💻' '🎵')

# Check if the script is running inside a tmux session
if [ -z "$TMUX" ]; then
  echo "This script must be run inside a tmux session."
  exit 1
fi

# Get the tmux window number
window_number=$(tmux display-message -p '#I')

# Check if the window number is within the range of the array
if (( window_number >= 0 && window_number < ${#special_characters[@]} )); then
  # Output the special character corresponding to the window number
  special_character=${special_characters[window_number]}
  echo "$special_character"
else
  echo "$window_number"
fi
