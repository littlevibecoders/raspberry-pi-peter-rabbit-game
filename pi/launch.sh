#!/usr/bin/env bash
# Opens Peter Rabbit full screen. The desktop icon runs this.
# The game gets its own Chromium profile, so it never touches your normal browser's
# history, cookies or saved passwords.
DIR="$HOME/peter-rabbit"
PROFILE="$HOME/.config/peter-rabbit-chromium"
CHROME="$(command -v chromium || command -v chromium-browser || true)"
[ -n "$CHROME" ] || { notify-send "Peter Rabbit" "Chromium isn't installed." 2>/dev/null; exit 1; }

# hide the "Chromium didn't shut down correctly" bar after an Alt+F4
P="$PROFILE/Default/Preferences"
[ -f "$P" ] && sed -i 's/"exited_cleanly":false/"exited_cleanly":true/; s/"exit_type":"[^"]*"/"exit_type":"Normal"/' "$P"

PLATFORM=""
[ -n "${WAYLAND_DISPLAY:-}" ] && PLATFORM="--ozone-platform=wayland"

exec "$CHROME" --kiosk --noerrdialogs --disable-infobars --no-first-run \
  --disable-session-crashed-bubble --autoplay-policy=no-user-gesture-required \
  $PLATFORM --user-data-dir="$PROFILE" "file://$DIR/peter_rabbit.html"
