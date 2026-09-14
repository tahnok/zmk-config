This is the zmk shield definition for the original Ergodox. It uses a [teensy2nicenano adaptor](https://github.com/tahnok/teensy2nicenano) PCB.

# Fork

This is not using mainline ZMK, instead it uses [kscan read by port](https://github.com/zmkfirmware/zmk/pull/1571) PR in order to have a responsive keyboard. This is because reading a key at a time from the MCP2038 IO Expander over i2c is much too slow.

# Keymap

As of Feb 2023, the keymap is [miryoku](https://github.com/manna-harbour/miryoku_zmk) inspired, but sort of halfway between an ergodox and a corne. Specifically it still has shift keys, and numbers, but it does use home row mods.

# Corne trackpoint

The right half has an IBM/Lenovo TrackPoint wired up over PS/2:

| TrackPoint | nice!nano |
| ---------- | --------- |
| DATA       | D0 (P0.08, UART RX — must be this pin) |
| CLK        | D1 (P0.06) |
| RST        | D9 (P1.06) |
| VCC / GND  | 3.3V / GND |

The PS/2 driver comes from [badjeff's fork](https://github.com/badjeff/kb_zmk_ps2_mouse_trackpoint_driver)
of [infused-kim's module](https://github.com/infused-kim/kb_zmk_ps2_mouse_trackpoint_driver),
pinned in `config/west.yml`. Only its PS/2 transport and zephyr input driver
are used — HID reporting, input processors and the mouse layer all come from
mainline ZMK's pointing support, so this no longer needs the old mouse-PR fork
of ZMK and the right half no longer has to be the split central.

Layout of the config:

- `config/trackpoint.dtsi` — the `zmk,input-split` proxy and the listener,
  shared by both halves.
- `config/corne_right.overlay` — the trackpoint hardware (pins, UART, reset),
  frees D1 from the stock corne's underglow SPI, and corrects for the
  trackpoint being mounted rotated 90°.
- `config/corne_left.overlay` — enables the listener on the central half.
- `config/corne.keymap` — the mouse layer (auto-enabled on movement) and the
  scroll layer.

Using it: nudge the trackpoint and the mouse layer turns on for 800ms after
the last movement. The left thumb keys become middle/left/right click, and
holding the inner right thumb key turns trackpoint movement into scrolling.
Any other key dismisses the layer and types normally.

If the pointer ever moves backwards along an axis, adjust the
`input-processors` line on `&tp_split` in `config/corne_right.overlay`.

For troubleshooting there is a `corne_right-nice_nano_v2-usb-logging` build
in `build.yaml`: flash it and `sudo cat /dev/ttyACM0` to watch the driver
find and initialise the trackpoint at boot.
