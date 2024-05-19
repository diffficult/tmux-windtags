#!/bin/bash

#set -euo pipefail

#CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

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

# Get the current window number
current_window_number=$(tmux display-message -p '#I')

# Get the active window number using tmux list-windows command and parsing
active_window_number=$(tmux list-windows | grep '(active)' | awk '{print $1}' | tr -d ':')

# Ensure both are integers before comparison
if [[ "$current_window_number" =~ ^[0-9]+$ ]] && [[ "$active_window_number" =~ ^[0-9]+$ ]]; then
  # If the current window is active, set the active character, otherwise set the normal character
  if [ "$current_window_number" -eq "$active_window_number" ]; then
    echo "${active_chars[$current_window_number]}"
  else
    echo "${normal_chars[$current_window_number]}"
  fi
else
  echo "Error: Window numbers are not valid integers."
fi
