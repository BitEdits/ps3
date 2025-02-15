PS3 BitEdits
============

PlayStation 3 Hacking Memorandum by Bit Edits.

# TOC

* Intro
* 1. SCE PS3 SDK
* 2. Open Source PS3 Light SDK
* 3. T2 SDE Linux
* 4. RPCS3 Emulator
* 5. RSX Driver for X.org
* 6. OpenGL driver for RSX
* 7. BD Ripping
* 8. PUP/PKG packing/unpacking
* 10. Homebrew Games

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
--------------

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
    ├── Preventing SPE Indefinite Stalls Resulting from Instruction Depletion in Cell Processor v1.0.pdf
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
наступний групи документів:

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
