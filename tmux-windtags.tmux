# Tmux plugin to replace window numbers with special characters

# Define a tmux variable to store the current window character
run-shell "tmux set -g @windtag '#($HOME/.config/tmux/plugins/tmux-windtags/scripts/window_tag.sh)'"

# Define the format for the window status (This will be in your tmux.conf)
# Note: No need to define window-status-format here, you can set it in your tmux.conf
