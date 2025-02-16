PS3 Firmwares
=============

Зміст:

* Види Firmwares
* Installing CFW Using 3.55 Keys
* Step 1: Understanding the Role of 3.55 Keys
* Step 2: Downgrading to 3.55
* Step 3: Patching the Core OS
* Step 4: Installing CFW via the PS3 Recovery Menu
* Step 5: Verifying the Installation & Unlocking Full Features
* Appendix 1: List of SCE Original Firmwares (OFW)

Цей документ описує види PS3 Firmwares, дає їх перелік та показує як робити downgrade.

# Види Firmwares

Існує два можливі способи для homebrew під PS3:

* CFW (Custom Firmware, повністю перезібрані PUP файли підписані ключами 3.55)
* HFW (Hybrid Firmware, оригінальні, незначно пропатчені PUP).

Основні вимоги для CFW наступні:

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

# Installing Rebug 4.86 (or Any CFW) Using 3.55 Keys

This process applies to fully hackable PS3 models (CECH-25XX or older)
and leverages the 3.55 private keys to install custom firmware.

# Step 1: Understanding the Role of 3.55 Keys

* Sony signs firmware updates with private keys, which ensure only official firmware (OFW) can be installed.
* The 3.55 keys were leaked, allowing custom firmware (CFW) to be signed in a way that the PS3 accepts as "legit."
* However, later firmware (like 4.86) uses stronger encryption, so direct installation is blocked.

# Step 2: Downgrading to 3.55 (If Needed)

* Option 1: Use a hardware flasher (E3 Flasher, Teensy, Progskeet) to downgrade to 3.55.
* Option 2: If on OFW 4.82 – 4.90, use PS3Xploit to install a hybrid firmware (HFW) and enable Flash Writer to allow CFW installation.

# Step 3: Patching the Core OS (Using 3.55 Keys)

* Official PS3 firmware updates are encrypted and signed using Sony's private keys.
* CFW developers (like Rebug) decrypt the firmware using known keys (3.55) and re-sign it with the same keys, allowing it to be installed on any PS3 that accepts 3.55-signed packages.
* Tools like scetool, fail0verflow's tools, or MFW Builder can be used to manually patch the firmware.
* CoreOS, lv1/lv2 (Hypervisor & Kernel), and selfs (executables) are modified to allow: 1) Homebrew execution; 2) Disabling signature checks; 3) Debugging/developer tools (DEX).

# Step 4: Installing Rebug 4.86 via the PS3 Recovery Menu

* Download Rebug 4.86.1 CFW (.PUP file).
* Format a USB drive to FAT32 and create a folder
* Place the Rebug .PUP file inside and rename it to PS3UPDAT.PUP
* Boot the PS3 into Recovery Mode (Safe Mode).
  Turn off the PS3, then hold the power button until it turns off.
  Hold the power button again until you hear two beeps, then release.
* Select System Update and install the Rebug firmware.

# Step 5: Verifying the Installation & Unlocking Full Features

* After the install, the PS3 will boot into Rebug CFW.
* To enable full debugging tools, install Rebug Toolbox.
* Optional: Enable Cobra Mode for extra features (ISO loading, PSP/PS2 support).
* Now, homebrew and backup managers (like Multiman or Webman) can be installed.

# Appendix 1: List of SCE Original Firmwares (OFW)

US ·  · April 2009 IDU 2.60
US ·  · 3.15 IDU Firmware Update
US ·  · 3.40 IDU-IDU FW Update
US ·  · GT5: IDU FW update 3.40
US ·  · 3.66 IDU FW
US ·  · PS3 IDU 3.50 FW: Oct 2010
US ·  · PS3 IDU 3.56 FW
US ·  · PS3 IDU 3.72 PS 3D Display Update
US ·  · PS3 IDU 431
US ·  · PS3 IDU Update 4.10
US ·  · PS3 IDU Update 430
US ·  · PS3 IDU: 2014 Holiday Refresh
US ·  · PS3 IDU: 2015 Holiday Refresh
US ·  · PS3 Standard IDU 4.23: Holiday 2012 Update
US ·  · PS3 System Software v.4.21: F/W Only
US ·  · Fall 2013: PS3 IDU 4.46
US ·  · Fall Refresh 2011: 3.70 IDU FW Update
US ·  · E-M Fall Refresh 3.40 IDU-IDU Update
US ·  · Spring Refresh 2010: 3.21 IDU Update (E-M)
US ·  · Spring Refresh 2011 3.60 IDU FW Update
US ·  · Summer Refresh 2011: 3.65 IDU FW Update
US ·  · Winter 2012 Refresh PS3 IDU 3.72
US ·  · Winter Refresh 2011: 3.55 FW Update
US ·  · Spring 2012 Refresh Standard: PS3 IDU 4.11
US ·  · Spring 2013: Standard IDU 4.31
US ·  · PlayStation Move Game Demo Disc
US ·  · PlayStation Move Game Demo Disc
US ·  · Inline Display: 2014 Holiday Refresh: Walmart
US ·  · Inline Video Player Display: 2015 Winter Refresh: Walmart
US ·  · Guitar Hero: Warriors of Rock 3.40 IDU FW Update
US ·  · Guitar Hero World Tour IDU 2.43
US ·  · Guitar Hero: Aerosmith IDU_IDU 2.35
WO ·  · Section 8: Prejudice
BR ·  · This Is the Next Level: 3D Games and Demo Disc
WO ·  · Until Dawn
US ·  · Walmart Endcap: 2014 Summer Refresh
US ·  · Endcap Display: 2014 Holiday Refresh: Walmart
US ·  · Endcap Display: 2015 Winter Refresh: Walmart
