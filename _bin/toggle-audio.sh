#!/usr/bin/env bash

# Toggle pulseaudio between headset & speakers

CARD1="alsa_output.pci-0000_01_00.1.hdmi-surround-extra2"
CARD2="alsa_output.usb-DeSheng_Electronics_Inc._XIBERIA-00.analog-stereo"

CURRENT_SINK="$(pacmd stat | awk -F": " '/^Default sink name: /{print $2}')"

if [ "$CURRENT_SINK" == "$CARD1" ]; then
    NEW_SINK="$CARD2"
else
    NEW_SINK="$CARD1"
fi

pactl set-default-sink "$NEW_SINK"

pactl list sink-inputs | grep -E '^Sink Input \#' | cut -d'#' -f2 |
while read -r sink_input; do
    pactl move-sink-input "$sink_input" "$NEW_SINK"
done

notify-send -t 3500 "Audio Switched" "$NEW_SINK"
