#!/usr/bin/env bash

# Increment, Decrement, & Toggle Mute on Default Audio Device
#
# Sends Desktop Notification after performing actions, replacing any existing
# notification window.

# Default Sink Description for Notifiation Titles
SINK_DESCRIPTION="$(pw-dump | jq 'map(select(.info.props["node.name"] == "'"$(pactl get-default-sink)"'"))|first|.info.props.["node.description"]' -r)"
# Where we store last notification ID for replacing notifications
CACHE_DIR="${HOME}/.cache/volume-control"
NOTIFICATION_ID_FILE="${CACHE_DIR}/notification-id"

sendNotification() {
    local TITLE="${1}"
    local BODY="${2}"
    local LAST_ID=""
    if [[ -f "${NOTIFICATION_ID_FILE}" ]]; then
        LAST_ID="$(cat "${NOTIFICATION_ID_FILE}")"
    fi
    if [[ -z "${LAST_ID}" ]]; then
        LAST_ID="0"
    fi
    THIS_ID="$(notify-send -p -t 3500 -r "${LAST_ID}" "${TITLE}" "${BODY}")"
    echo "${THIS_ID}" > "${NOTIFICATION_ID_FILE}"
}

adjustVolume() {
    local VOLUME_DELTA="${1}"
    pactl set-sink-volume @DEFAULT_SINK@ "$VOLUME_DELTA"
}

volumeNotification() {
    local VOLUME
    # Volume as a percentage with no trailing decimals
    VOLUME="$(echo "$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -oE '([[:digit:]]|\.)+') * 100" | bc | grep -oE '^[[:digit:]]+')"
    sendNotification "${SINK_DESCRIPTION}" "Volume: ${VOLUME}%"
}

toggleMute() {
    pactl set-sink-mute @DEFAULT_SINK@ toggle
}

muteNotification() {
    local BODY
    if [[ "$(pactl get-sink-mute @DEFAULT_SINK@)" = "Mute: yes" ]]; then
        BODY="Muted"
    else
        BODY="Unmuted"
    fi
    sendNotification "${SINK_DESCRIPTION}" "${BODY}"
}

mkdir -p "${CACHE_DIR}"

case "$1" in
    "up")
        adjustVolume "+0.25dB"; volumeNotification
        ;;
    "down")
        adjustVolume "-0.25dB"; volumeNotification
        ;;
    "toggle-mute")
        toggleMute; muteNotification
        ;;
    *) 
        echo -e "Unexpected argument: $1\nWanted one of: 'up', 'down', 'toggle-mute'"
        exit 1
        ;;
esac
