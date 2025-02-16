PS3 Emulation of PS2 and PS1
============================

TOC:

* PS3 Models That Include ps2_emu.self Backward-Compatible (BC) Models
* Non-Backward-Compatible (Non-BC) Models
* PS3 Super Slim (CECH-40xx and later):

# PS2 Hardware

* CECHAxx, CECHBxx, CECHCxx, CECHExx (PS3 Fat models with hardware PS2 support).
* These use hardware-assisted emulation (PS2 Emotion Engine & Graphics Synthesizer).
* `ps2_emu.self` module.

# PS2 Graphic Synthesizer

* Later PS3 Fat models (CECHGxx and later) and all PS3 Slim models use software emulation.
* These contain `ps2_gxemu.self`, but without full hardware support.

# PS3 Super Slim (CECH-40xx and later):

* These models lack PS2 emulation support in official firmware.
* Have a limited `ps2_netemu.self` for digital PS2 Classics (PSN).

