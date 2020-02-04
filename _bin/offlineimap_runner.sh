#!/bin/bash
read -r pid < ~/.offlineimap/pid

if ps $pid &>/dev/null; then
  echo "offlineimap ($pid): another instance running." >&2
  kill -9 $pid
fi

offlineimap -o -u quiet "$@" &
OIPID=$!
echo $OIPID > ~/.offlineimap/pid
