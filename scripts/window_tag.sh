#!/bin/bash

set -euo pipefail

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

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

# Get the window number corresponding to the current window ID
current_window_number=$(tmux list-windows -F "#{window_id}:#{window_index}" | grep "$current_window_id" | cut -d':' -f2)

# Get the window number corresponding to the active window ID
active_window_number=$(tmux list-windows -F "#{window_id}:#{window_index}" | grep "$active_window_id" | cut -d':' -f2)

# If the current window is active, echo the active character, otherwise echo the normal character
if [ "$current_window_number" -eq "$active_window_number" ]; then
  echo ${active_chars[$current_window_number]}
else
  echo ${normal_chars[$current_window_number]}
fi

