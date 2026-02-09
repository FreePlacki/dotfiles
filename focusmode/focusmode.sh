#!/bin/sh

CONFIG="$HOME/.config/focusmode.txt"
TMP="/tmp/focusmode.txt"

# Gruvbox dark palette
colors=(
  "#928374" # gray
  "#fb4934" # red
  "#b8bb26" # green
  "#fabd2f" # yellow
  "#83a598" # blue
  "#d3869b" # purple
  "#8ec07c" # aqua
  "#fe8019" # orange
)

# Show cached value or first non-empty config line
if [ "$1" = "show" ]; then
  [ -f "$TMP" ] && cat "$TMP" && exit 0
  [ -f "$CONFIG" ] && awk 'NF{print; exit}' "$CONFIG"
  exit 0
fi

# Read non-empty lines into an array
if [ ! -f "$CONFIG" ]; then
  exit 1
fi
mapfile -t modes < <(awk 'NF' "$CONFIG")
[ "${#modes[@]}" -eq 0 ] && exit 1

# Select mode with dmenu
mode=$(printf "%s\n" "${modes[@]}" | dmenu -b -i -p 'Set focus mode:')
[ -z "$mode" ] && exit 0

# Find index (1-based) of selected mode among modes[]
index=-1
for i in "${!modes[@]}"; do
  if [ "${modes[i]}" = "$mode" ]; then
    index=$i
    break
  fi
done

if [ $index -eq -1 ]; then
    exit 0
fi

color_index=$(( index % ${#colors[@]} ))
color="${colors[$color_index]}"

# Write formatted output
echo "%{F$color}$mode%{F-}" > "$TMP"

if command -v timew >/dev/null 2>&1; then
  if [ "$mode" != "IDLE" ]; then
    timew start "$mode" >/dev/null 2>&1
  else
    timew stop >/dev/null 2>&1
  fi
fi
