#!/bin/bash

# Define an array of special characters corresponding to window numbers 0 to 9 for non-active windows
#
normal_chars=("󰎣 " "󰎦 " "󰎩 " "󰎬 " "󰎮 " "󰎰 " "󰎵 " "󰎸 " "󰎻 " "󰎾 ")
# normal_chars=("⓿ " "① " "② " "③ " "④ " "⑤ " "⑥ " "⑦ " "⑧ " "⑨ ")

# Define an array of special characters corresponding to window numbers 0 to 9 for the active window
active_chars=("󰼎 " "󰼏 " "󰼐 " "󰼑 " "󰼒 " "󰼓 " "󰼔 " "󰼕 " "󰼖 " "󰼗 ")
#active_chars=("⓪ " "❶ " "❷ " "❸ " "❹ " "❺ " "❻ " "❼ " "❽ " "❾ ")

#  "󰎦 " "󰎩 " "󰎬 " "󰎮 " "󰎰 " "󰎵 " "󰎸 " "󰎻 " "󰎾 " "󰎣 "
#  "󰎥 " "󰎨 " "󰎫 " "󰎲 " "󰎯 " "󰎴 " "󰎷 " "󰎺 " "󰎽 " "󰎢 "
#  "󰼏 " "󰼐 " "󰼑 " "󰼒 " "󰼓 " "󰼔 " "󰼕 " "󰼖 " "󰼗 " "󰼎 "

# Get the current window number and the active window number in tmux
current_window_number=$(tmux display-message -p '#I')
active_window_number=$(tmux display-message -p '#W')

# If the current window is active, echo the active character, otherwise echo the normal character
if [ "$current_window_number" -eq "$active_window_number" ]; then
  echo ${active_chars[$current_window_number]}
else
  echo ${normal_chars[$current_window_number]}
fi

