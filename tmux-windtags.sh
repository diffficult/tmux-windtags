#!/bin/bash

# Define tags for each window index
tags=("󰎦 " "󰎩 " "󰎬 " "󰎮 " "󰎰 " "󰎵 " "󰎸 " "󰎻 " "󰎾 " "󰿫 ")

# Set characters for each window number
# set -g window_tag_1 "󰎦 " # 󰎥  󰼏
# set -g window_tag_2 "󰎩 " # 󰎨  󰼐
# set -g window_tag_3 "󰎬 " # 󰎫  󰼑
# set -g window_tag_4 "󰎮 " # 󰎲  󰼒
# set -g window_tag_5 "󰎰 " # 󰎯  󰼓
# set -g window_tag_6 "󰎵 " # 󰎴  󰼔
# set -g window_tag_7 "󰎸 " # 󰎷  󰼕
# set -g window_tag_8 "󰎻 " # 󰎺  󰼖
# set -g window_tag_9 "󰎾 " # 󰎽  󰼗
# set -g window_tag_0 "󰎣 " # 󰎢  󰼎


# Iterate through each tmux window and set the tag
for i in "${!tags[@]}"; do
  if tmux list-windows | grep -q "^$i:"; then
    window_name=$(tmux display-message -p -F "#{window_name}" -t $i)
    tmux rename-window -t $i "${tags[$i]} $window_name"
  fi
done
