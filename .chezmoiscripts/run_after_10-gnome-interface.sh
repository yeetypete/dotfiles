#!/bin/sh
set -eu

command -v dconf >/dev/null || exit 0

dconf load /org/gnome/desktop/interface/ <<'KEYS'
[/]
accent-color='teal'
color-scheme='prefer-dark'
KEYS
