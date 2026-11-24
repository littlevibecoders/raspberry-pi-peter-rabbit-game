#!/usr/bin/env bash
# Puts Peter Rabbit Hide & Seek on a Raspberry Pi desktop (and in the menu under Games).
# Run it ON the Pi, from the folder you downloaded:   bash pi/install.sh
# It only touches files in your own home folder. No sudo needed. Nothing is downloaded.
set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DIR="$HOME/peter-rabbit"

for f in "$HERE/docs/index.html" "$HERE/docs/images/icon.png" "$HERE/pi/launch.sh"; do
  [ -f "$f" ] || { echo "Can't find $f. Run this from inside the downloaded project folder."; exit 1; }
done

if ! command -v chromium >/dev/null 2>&1 && ! command -v chromium-browser >/dev/null 2>&1; then
  echo "Chromium isn't installed. Raspberry Pi OS (with desktop) has it already."
  echo "Install it with:  sudo apt install chromium   and run this again."
  exit 1
fi

# 1. copy the game into its own folder
mkdir -p "$DIR"
install -m 644 "$HERE/docs/index.html"       "$DIR/peter_rabbit.html"
install -m 644 "$HERE/docs/images/icon.png"  "$DIR/peter-rabbit.png"
install -m 755 "$HERE/pi/launch.sh"          "$DIR/launch.sh"
sed -i 's/\r$//' "$DIR/launch.sh"   # in case the file picked up Windows line endings

# 2. make a desktop icon and a menu entry
DESK="$(xdg-user-dir DESKTOP 2>/dev/null || true)"
{ [ -n "$DESK" ] && [ "$DESK" != "$HOME" ]; } || DESK="$HOME/Desktop"
mkdir -p "$DESK" "$HOME/.local/share/applications"

ENTRY="[Desktop Entry]
Type=Application
Name=Peter Rabbit
Comment=Find Peter Rabbit in the garden before night falls
Exec=$DIR/launch.sh
Icon=$DIR/peter-rabbit.png
Terminal=false
Categories=Game;"

for f in "$DESK/peter-rabbit.desktop" "$HOME/.local/share/applications/peter-rabbit.desktop"; do
  printf '%s\n' "$ENTRY" > "$f"
  chmod 755 "$f"
done
# let the file manager open the icon without asking "do you trust this?"
gio set "$DESK/peter-rabbit.desktop" metadata::trusted true 2>/dev/null || true
pcmanfm --reconfigure >/dev/null 2>&1 || true

echo "Done! Double-click the Peter Rabbit icon on the desktop to play."
echo "To close the game: press the rainbow X in the top-right corner, or Alt+F4."
