# Physical layouts

These local geometry files keep diagram generation independent of keyboard
metadata services. Keys are ordered to match each ZMK keymap's bindings.

- `corne.json`: the 42-key `LAYOUT_split_3x6_3` from
  [keymap-drawer's Corne geometry](https://github.com/caksoylar/keymap-drawer/blob/main/resources/extra_layouts/corne_rotated.json).
- `ergodox.json`: the 76-key `LAYOUT_ergodox` geometry from
  [QMK's ErgoDox EZ definition](https://github.com/qmk/qmk_firmware/blob/master/keyboards/ergodox_ez/info.json),
  reordered to match `config/boards/shields/ergodox/ergodox.overlay`.
  In particular, the thumb bindings follow this repo's transform rather than
  QMK's order: left Page Up / Page Down, right top pair; then left Space / GUI /
  inner key, right inner key / Enter / Backspace; then the bottom inner pair.

If the number or order of bindings changes, update the corresponding geometry
as well. Keymap-drawer checks the number of keys when rendering, but cannot
detect a same-size reordering.
