PS3 Bit Edits
=============

PlayStation 3 Hacking Memorandum by Bit Edits.

# TOC

* Intro
* SCE PS3 SDK
* PS3 Firmwares
* PS3 Emulation of PS2 and PS1
* RPCS3 Emulator
* BD Ripping
* PUP/PKG packing/unpacking for 3.55
* Open Source PS3 Light SDK
* RSX Driver for X.org
* OpenGL driver for RSX
* T2 SDE Linux

# Intro

Якщо ви читаєте цей документ, значить, ви або досліджуєте старі
комп’ютерні системи, або займаєтеся демосценою для ретро-консолей,
або вивчаєте мікропроцесорні архітектури, або просто захоплюєтеся
ретро-технологіями.

Світ консолей багато в чому схожий на демосцену, де розробники
працюють в умовах обмежених ресурсів. Для PS3 це двоядерний
процесор PPC з 8 DSP-модулями та графічний прискорювач GTX 780.
Ця консоль стала важливим етапом в історії OpenGL ES і знаменувала
перехід від MIPS-архітектури PlayStation 2 — останньої MIPS-консолі
після PS1 і N64.

PS3 здобула культовий статус серед науковців, які використовували
її для швидкого перетворення Фур'є в астрофізичних дослідженнях.
В університетах на її базі будували суперкомп’ютери, а разом із
ігровою сценою залишилося чимало симулятивних фреймворків, які й
досі можуть бути корисними для навчання.

Варто зазначити, що з юридичної точки зору вам заборонено дизасемблювати
код корпорацій і займатися реверс-інжинірингом (не кажучи вже про
завантаження ROM-файлів з інтернету). Однак вам дозволено переглядати
код на Github.

На щастя, всі ROM-файли PS3 знаходяться у відкритому доступі, тож, на
відміну від Nintendo 64, вам не доведеться використовувати програматори
чи зчитувачі ROM. Ви можете мати консоль із прошивкою 3.50, офіційно
встановити на неї Linux і запускати власний код. Також вам не заборонено
створювати резервні копії BD-дисків для запуску в емуляторі RPCS3.

Будь-яка інформація, що розкриває внутрішні дані Sony, має юридичні
обмеження, тому варто уникати її використання у легальних проєктах.
Наукові дослідження, що базуються на відкритих джерелах і мають виключно
освітню мету без комерційного інтересу, не створюють юридичних ризиків.

# SCE PS3 SDK

PS3 SCE SDK описано у відповідному файлі: <a href="PS3-SDK.md">PS3-SDK.md</a>.

# PS3 Firmwares

PS3 Firmwares описано у відповідному файлі: <a href="PS3-FW.md">PS3-FW.md</a>.

# PS3 Emulation of PS2 and PS1

Про підтримку PS1 і PS2 ігор в Core OS на PS3 читайте у відповідному файлі: <a href="PS3-EMU.md">PS3-EMU.md</a>.

# PUP/PKG packing/unpacking for 3.55

Пакет програм

PS3UPDAT.PUP:

```
dots.txt
fix_tar
license.xml
ps3swu.self
update_files.tar
update_flags.txt
version.txt
vsh.tar
```

update_files.tar:

```
BDIT_FIRMWARE_PACKAGE.pkg
BDPT_FIRMWARE_PACKAGE_301R.pkg
BDPT_FIRMWARE_PACKAGE_302R.pkg
BDPT_FIRMWARE_PACKAGE_303R.pkg
BDPT_FIRMWARE_PACKAGE_304R.pkg
BDPT_FIRMWARE_PACKAGE_306R.pkg
BDPT_FIRMWARE_PACKAGE_308R.pkg
BLUETOOTH_FIRMWARE.pkg
CORE_OS_PACKAGE.pkg
MULTI_CARD_FIRMWARE.pkg
RL_FOR_PACKAGE.img
RL_FOR_PROGRAM.img
SYS_CON_FIRMWARE_01000006.pkg
SYS_CON_FIRMWARE_01010303.pkg
SYS_CON_FIRMWARE_01020302.pkg
SYS_CON_FIRMWARE_01030302.pkg
SYS_CON_FIRMWARE_01040402.pkg
SYS_CON_FIRMWARE_01050002.pkg
SYS_CON_FIRMWARE_01050101.pkg
SYS_CON_FIRMWARE_S1_00010002083E0832.pkg
UPL.xml.pkg
dev_flash3_022.tar.aa.2010_11_27_051800
dev_flash_000.tar.aa.2010_11_27_051337
dev_flash_001.tar.aa.2010_11_27_051337
dev_flash_002.tar.aa.2010_11_27_051337
dev_flash_003.tar.aa.2010_11_27_051337
dev_flash_004.tar.aa.2010_11_27_051337
dev_flash_005.tar.aa.2010_11_27_051337
dev_flash_006.tar.aa.2010_11_27_051337
dev_flash_007.tar.aa.2010_11_27_051337
dev_flash_008.tar.aa.2010_11_27_051337
dev_flash_009.tar.aa.2010_11_27_051337
dev_flash_010.tar.aa.2010_11_27_051337
dev_flash_011.tar.aa.2010_11_27_051337
dev_flash_012.tar.aa.2010_11_27_051337
dev_flash_013.tar.aa.2010_11_27_051337
dev_flash_014.tar.aa.2010_11_27_051337
dev_flash_015.tar.aa.2010_11_27_051337
dev_flash_016.tar.aa.2010_11_27_051337
dev_flash_017.tar.aa.2010_11_27_051337
dev_flash_018.tar.aa.2010_11_27_051337
dev_flash_019.tar.aa.2010_11_27_051337
dev_flash_020.tar.aa.2010_11_27_051337
dev_flash_021.tar.aa.2010_11_27_051337
```

CORE_OS_PACKAGE.pkg:

```
aim_spu_module.self
appldr
creserved_0
default.spp
emer_init.self
eurus_fw.bin
hdd_copy.self
isoldr
lv0
lv1.self
lv1ldr
lv2_kernel.self
lv2ldr
manu_info_spu_module.self
mc_iso_spu_module.self
me_iso_spu_module.self
sb_iso_spu_module.self
sc_iso.self
sdk_version
spp_verifier.self
spu_pkg_rvk_verifier.self
spu_token_processor.self
spu_utoken_processor.self
sv_iso_spu_module.self
```

How to extract ELF from PKG from PUP using ps3tools:

```sh
pup x PS3UPDAT.PUP 3.55
unpkg -s 3.55/CORE_OS_PACKAGE.pkg temp
cosunpkg temp CORE_OS_PACKAGE.Content
unself CORE_OS_PACKAGE.Content/lv2_kernel.self lv2_kernel.elf
```

or simply:

```
 ./core_os_extractor.sh PS3UPDAT.PUP
 ./dev_flash_extractor_linux.sh PS3UPDAT.PUP flash
```

How to pack ELF into PKG into PUP:
