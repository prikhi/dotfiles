#!/usr/bin/env bash

# Toggle pulseaudio between headset & speakers

# 5.1 system
SPEAKER_DEVICE_DESCRIPTION='AD102 High Definition Audio Controller'
SPEAKER_PROFILE_DESCRIPTION='Digital Surround 5.1 (HDMI 3)'
SPEAKER_DEVICE="$(pw-dump Device | jq 'map(select(.info.props|.["device.description"] == "'"${SPEAKER_DEVICE_DESCRIPTION}"'"))|first')"
SPEAKER_DEVICE_ID="$(echo -E "${SPEAKER_DEVICE}" | jq -r '.id')"
SPEAKER_PROFILE="$(echo -E "${SPEAKER_DEVICE}" | jq '.info.params.EnumProfile|map(select(.description == "'"${SPEAKER_PROFILE_DESCRIPTION}"' Output"))|first')"
SPEAKER_PROFILE_NAME=$(echo -E "${SPEAKER_PROFILE}" | jq -r '.description' | sed -e 's| Output||')

# Headphones
HEADPHONE_DEVICE_DESCRIPTION='FiiO K7'
HEADPHONE_PROFILE_DESCRIPTION='Digital Stereo (IEC958)'
HEADPHONE_DEVICE="$(pw-dump Device | jq 'map(select(.info.props|.["device.description"] == "'"${HEADPHONE_DEVICE_DESCRIPTION}"'"))|first')"
HEADPHONE_DEVICE_ID="$(echo -E "${HEADPHONE_DEVICE}" | jq -r '.id')"
HEADPHONE_PROFILE="$(echo -E "${HEADPHONE_DEVICE}" | jq '.info.params.EnumProfile|map(select(.description == "'"${HEADPHONE_PROFILE_DESCRIPTION}"' Output"))|first')"


DEVICE_ID=""
PROFILE_IDX=""
PROFILE_DESCRIPTION=""
if wpctl status | grep -qE "\*.*${SPEAKER_PROFILE_NAME/\(/\\(}"; then
    DEVICE_ID="${HEADPHONE_DEVICE_ID}"
    PROFILE_IDX="$(echo -E "${HEADPHONE_PROFILE}" | jq -r '.index')"
    PROFILE_DESCRIPTION="${HEADPHONE_PROFILE_DESCRIPTION}"
    NOTIFICATION_BODY="Headphones"
else
    DEVICE_ID="${SPEAKER_DEVICE_ID}"
    PROFILE_IDX="$(echo -E "${SPEAKER_PROFILE}" | jq -r '.index')"
    PROFILE_DESCRIPTION="${SPEAKER_PROFILE_DESCRIPTION}"
    NOTIFICATION_BODY="5.1 Speakers"
fi
PROFILE_NODE_ID="$(pw-dump Node | jq 'map(select((.info.props|.["device.id"] == '"${DEVICE_ID}"') and (.info.props|.["device.profile.description"] == "'"${PROFILE_DESCRIPTION}"'")))|first|.id')"
wpctl set-profile "${DEVICE_ID}" "${PROFILE_IDX}"
wpctl set-default "${PROFILE_NODE_ID}"

notify-send -t 3500 "Audio Switched" "${NOTIFICATION_BODY}"
