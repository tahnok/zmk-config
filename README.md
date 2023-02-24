This is the zmk shield definition for the original Ergodox. It uses a [teensy2nicenano adaptor](https://github.com/tahnok/teensy2nicenano) PCB.

# Fork

This is not using mainline ZMK, instead it uses [kscan read by port](https://github.com/zmkfirmware/zmk/pull/1571) PR in order to have a responsive keyboard. This is because reading a key at a time from the MCP2038 IO Expander over i2c is much too slow.

# Keymap

As of Feb 2023, the keymap is [miryoku](https://github.com/manna-harbour/miryoku_zmk) inspired, but sort of halfway between an ergodox and a corne. Specifically it still has shift keys, and numbers, but it does use home row mods.
