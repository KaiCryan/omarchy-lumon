#!/usr/bin/env bash
# Install the whole Lumon / Severance set for Omarchy.
# Clones each repo into ~/.local/share/omarchy-lumon/ and runs its installer.
set -euo pipefail

BASE="${OMARCHY_LUMON_DIR:-$HOME/.local/share/omarchy-lumon}"
GH="https://github.com/KaiCryan"

# repo -> install command (run from inside the clone)
ORDER=(assets theme wallpapers greeting screensaver lock quote boot)
declare -A REPO=(
  [assets]=omarchy-lumon-assets
  [theme]=omarchy-lumon-theme
  [wallpapers]=omarchy-lumon-wallpapers
  [greeting]=omarchy-lumon-greeting
  [screensaver]=omarchy-lumon-screensaver
  [lock]=omarchy-lumon-lock
  [quote]=omarchy-desktop-quote
  [boot]=omarchy-lumon-boot
)

SKIP=()
while [[ $# -gt 0 ]]; do
  case "$1" in
    --skip) SKIP+=("$2"); shift 2 ;;
    -h|--help) grep '^#' "$0" | cut -c3-; exit 0 ;;
    *) echo "unknown arg: $1" >&2; exit 1 ;;
  esac
done
skipped() { local x; for x in "${SKIP[@]:-}"; do [[ "$x" == "$1" ]] && return 0; done; return 1; }

command -v omarchy >/dev/null || { echo "omarchy not found — this needs Omarchy." >&2; exit 1; }
mkdir -p "$BASE"

for key in "${ORDER[@]}"; do
  name="${REPO[$key]}"
  if skipped "$key"; then echo ":: skipping $key"; continue; fi

  dir="$BASE/$name"
  if [[ -d "$dir/.git" ]]; then
    echo ":: updating $name"; git -C "$dir" pull --ff-only
  else
    echo ":: cloning $name"; git clone --depth 1 "$GH/$name" "$dir"
  fi
  cd "$dir"

  case "$key" in
    assets)
      echo ":: $name is a shared asset repo — nothing to install"
      ;;
    quote)
      omarchy plugin add "$GH/$name" 2>/dev/null || true
      omarchy plugin enable kaicryan.desktop-quote
      ;;
    screensaver)
      ./install.sh
      ./patch-idle.sh
      ;;
    boot)
      echo
      read -rp ":: the boot splash needs sudo (copies a Plymouth theme, rebuilds initramfs). Run it now? [y/N] " a
      [[ "$a" == [yY] ]] && sudo ./install.sh || echo ":: skipped boot — run 'sudo ./install.sh' in $dir later"
      ;;
    *)
      ./install.sh
      ;;
  esac
done

echo
echo "Done. Open a new terminal for the greeting; reboot for the boot splash."
