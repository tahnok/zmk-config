#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."
mkdir -p keymap-drawer

uv run --locked keymap -c keymap_drawer.config.yaml parse -z config/corne.keymap \
  -o keymap-drawer/corne.yaml
uv run --locked keymap -c keymap_drawer.config.yaml draw keymap-drawer/corne.yaml \
  -j keymap-layouts/corne.json -l LAYOUT -o keymap-drawer/corne.svg

uv run --locked keymap -c keymap_drawer.config.yaml parse \
  -z config/boards/shields/ergodox/ergodox.keymap \
  -l Base Numbers Symbols Media -o keymap-drawer/ergodox.yaml
uv run --locked keymap -c keymap_drawer.config.yaml draw keymap-drawer/ergodox.yaml \
  -j keymap-layouts/ergodox.json -l LAYOUT -o keymap-drawer/ergodox.svg
