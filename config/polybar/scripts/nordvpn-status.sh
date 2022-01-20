#!/bin/sh

STATUS=$(nordvpn status | grep Status | tr -d ' ' | cut -d ':' -f2)

if [ "$STATUS" = "Connected" ]; then
  echo "%{F#e0def4}%{A1:nordvpn d:}$(nordvpn status | grep City | cut -d ':' -f2) %{A}%{F-}"
else
  echo "%{F#e0def4}%{A1:nordvpn c:} no vpn %{A}%{F-}"
fi
