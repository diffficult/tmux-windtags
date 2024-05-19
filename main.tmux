# Ensure the script is executable
run-shell "chmod +x ~/.config/tmux/plugins/tmux-windtag/scripts/window-tag.sh"

# Function to get window tag
get_window_tag() {
  ~/.config/tmux/plugins/tmux-windtag/scripts/window-tag.sh
}

# Set window status format using the get_window_tag function
set -g @window_tag_format '#{get_window_tag}'

# Example of how to use the variable in tmux.conf
# You can replace #I with #{@window_tag_format} in your tmux status configuration
EOF