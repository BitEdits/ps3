PS3 Bit Edits
=============

PlayStation 3 Hacking Memorandum by Bit Edits.

# TOC

* Intro
* SCE PS3 SDK
* Open Source PS3 Light SDK
* T2 SDE Linux
* RPCS3 Emulator
* RSX Driver for X.org
* OpenGL driver for RSX
* BD Ripping
* Homebrew Rebug CFW 3.55
* PUP/PKG packing/unpacking for 3.55

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

Якшо вам пощастило отримати офіційний DevKit, то у вас має бути в комплекті
офіційне SDK, яке складається умовно з публічних і непублічних документів.
До публічних документів входить документація по процесору Cell Broadband Engine:

```
├── Cell Broadband Engine
│   ├── CBE_Programmers_Guide_v3.1.pdf
│   ├── Cell Broadband Engine Architecture v1.01.pdf
│   ├── Cell Broadband Engine Architecture v1.02.pdf
│   ├── Cell Broadband Engine C,C++ Language Extensions v2.2.1.pdf
│   ├── Cell Broadband Engine C,C++ Language Extensions v2.3.pdf
│   ├── Cell Broadband Engine C,C++ Language Extensions v2.5.pdf
│   ├── Cell Broadband Engine C,C++ Language Extensions v2.6.pdf
│   ├── Cell Broadband Engine Programming Handbook v1.1.pdf
│   ├── Cell Broadband Engine Programming Tutorial v2.0.pdf
│   ├── Cell Broadband Engine Registers v1.5.1.pdf
│   ├── Cell Broadband Engine Registers v1.5.pdf
│   ├── Cell Broadband Engine SIMD Math Library Specification v1.0.pdf
│   ├── Cell Broadband Engine SIMD Math Library Specification v1.2.pdf
│   └── vector_simd_pem_v_2.07c_26Oct2006_cell.pdf
├── Mathematical Frameworks
│   ├── 3D_FFT_Prog_Guide_and_API_Reference.pdf
│   ├── ALF_Prog_Guide_API_v3.1.pdf
│   ├── CBE_SIMDmath_API_v3.1.pdf
│   ├── LAPACK_Prog_Guide_API_v3.1.pdf
│   ├── Monte_Carlo_Prog_Guide_API_v3.1.pdf
│   ├── SIMD_Library_Specification_for_CBEA_1.2.pdf
│   └── libFFT_Prog_Guide_API_v3.1.pdf
├── PowerPC Architecture
│   ├── PPC_v202_Book1_Instruction_Set.pdf
│   ├── PPC_v202_Book2_Virtual_Environment.pdf
│   └── PPC_v202_Book3_Operating_Environment.pdf
├── Software Development Kit
│   ├── Cell_BE_Boot_Process.pdf
│   ├── IDE_Users_Guide_v3.1.pdf
│   ├── OpenCL_Guide.pdf
│   └── SDK-Installation_Guide_v3.1.pdf
└── Synergistic Processing Unit
    ├── Preventing SPE Indefinite Stalls Resulting from Instruction Depletion v1.0.pdf
    ├── SPU Application Binary Interface Specification v1.6.pdf
    ├── SPU Application Binary Interface Specification v1.9.pdf
    ├── SPU Assembly Language Specification v1.4.pdf
    ├── SPU Assembly Language Specification v1.7.pdf
    ├── SPU_ABI-Specification_1.9.pdf
    ├── SPU_Runtime_Library_Extensions_v3.1.pdf
    ├── Synergistic Processor Unit Instruction Set v1.2 (IBM).pdf
    └── Synergistic Processor Unit Instruction Set v1.2 (Sony).pdf
```

До конфіденційних документів входить, як це часто буває у подібних продуктах,
наступні групи документів:

Системне програмування

* System Overview
* Application Requirements
* System GUI
* File Access
* Save Data
* Media Contents
* Sample Framework

Налагодження

* Development Environment
* Debugging Support
* DECI3
* Performance Analysis

Операційна система і системні бібліотеки

* Peripherals
* SPURS
* SPU Libraries
* OS and Basic Libraries
* OS Low-level Specifications
* Other Libraries

Графічні бібліотеки

* Image Recognition
* RSX Graphics
* Graphics PSGL
* Graphics Materials

Аудіо Бібліотеки

* Sound
* Sound High-level
* Streaming
* Streaming High-level

Мережеві бібліотеки

* Бібоітеки UDP, HTTP, Download/Upload utilities
* PSN
* PSN Commerce
* PSP

# Homebrew Rebug CWF 3.55

Існує два можливі способи для homebrew під PS3 CFW (Custom Firmware, повністю перезібрані PUP файли підписані ключами 3.55)
і HFW (Hybrid Firmware, оригінальні, незначно пропатчені PUP). Основні вимоги для CFW наступні:

* PS3 яка з заводу мала прошивку 3.55, або менше (критерій);
* Модифікований образ CFW PUP файлу на USB носії FAT32.

Якшо моделі не були випущені пізніше 3.55 (Slim і Super Slim моделі), то на такі
консолі можна поставили лише HFW + HEN образи.

Функція | CFW | HFW
--- | --- | ---
Застосовуваність|Моделі з 3.55|Будь-які
Homebrew|Повна|HEN
Backup|Повна (ISO/PKG)|Обмежена (HEN)
DEX|CEX/DEX переключення|CEX
Cobra|Так|HEN
Ban|Малоймовірно|Високоймовірно
Простота|Складно|Простіше
Остання версія|4.86|4.90

Основні переваги CFW (Rebug):

* Підтрика DEX функцій
* Підтрика розширений дороблених емуляторів PS2 і PS1
* Підтрика BD в UDF форматі або у вигляді каталогів
* Відключення певних OS API syscalls
* Підтримка бекапа ігор і системи

Останні версії CWF (Rebug):

* Rebug 4.86.1 LITE для ретейл PS3 (CEX)
* Rebug 4.86.1 REX/D-REX для DevKit (CEX/DEX)

# PUP/PKG packing/unpacking for 3.55

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

How to extract ELF from PKG from PUP:

```sh
pup x PS3UPDAT.PUP 3.55
unpkg -s 3.55/CORE_OS_PACKAGE.pkg temp
cosunpkg temp CORE_OS_PACKAGE.Content
unself CORE_OS_PACKAGE.Content/lv2_kernel.self lv2_kernel.elf
```

How to pack ELF into PKG into PUP:
