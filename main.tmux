# Hook to rename windows when a new window is created
set-hook -g after-new-window "run-shell '~/.config/tmux/tpm/plugins/tmux-windtags/tmux-window-tags.sh'"
set-hook -g after-rename-window "run-shell '~/.config/tmux/tpm/plugins/tmux-windtags/tmux-window-tags.sh'"
set-hook -g after-move-window "run-shell '~/.config/tmux/tpm/plugins/tmux-windtags/tmux-window-tags.sh'"

# Run the script initially
run-shell '~/.config/tmux/tpm/plugins/tmux-windtags/tmux-windtags.sh'
