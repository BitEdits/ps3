PS3 SCE Tool
============

Open PS3 SCE Tool `ps3sce` is a clone of `scetool` under an open source license.
`scetool` was reverse engineered and analized to produce this program, and copied his behaivour.

# Installation

The instalation is the same of the scetool.  
You should put your keys inside the data directory along with the vsh\_curves & ldr\_curves
Your idps and actdat should be inside the data directory too.  
The rap files should go inside the raps directory (at the same level of data directory).  
The rif files should go inside the rifs directory (at the same level of data directory).  
You can put klics.txt in the data directory and it will automatically find the klicensee
by looking up the content\_id. 

If you wish, you can set the PS3 environment variable to point to the data directory 
(your raps & rifs should go in the rap and rif directory).  

# Usage

The usage is exactly the same of the original SCETool, so if you know how to use it.  
You know how to use this tool.  

The new options available are "-p" to patch the ELF the same way FixELF.exe does.
Also, if klics.txt is available, it can automatically choose the klicensee. 
  
```
USAGE: oscetool [options] command  
COMMANDS                Parameters            Explanation  
 -h, --help                                   Print this help.  
 -k, --print-keys                             List keys.  
 -i, --print-infos      File-in               Print SCE file info.  
 -d, --decrypt          File-in File-out      Decrypt/dump SCE file.  
 -e, --encrypt          File-in File-out      Encrypt/create SCE file.  
OPTIONS                 Possible Values       Explanation  
 -v, --verbose                                Enable verbose output.  
 -r, --raw                                    Enable raw value output.  
 -t, --template         File-in               Template file (SELF only)  
 -0, --sce-type         SELF/RVK/PKG/SPP      SCE File Type  
 -1, --compress-data    TRUE/FALSE(default)   Whether to compress data or not.  
 -s, --skip-sections    TRUE(default)/FALSE   Whether to skip sections or not.  
 -2, --key-revision     e.g. 00,01,...,0A,... Key Revision  
 -m, --meta-info        64 bytes              Use provided meta info to decrypt.    
 -K, --keyset           32(Key)16(IV)  
                        40(Pub)21(Priv)1(CT)  Override keyset.  
 -3, --self-auth-id     e.g. 1010000001000003 Authentication ID  
 -4, --self-vendor-id   e.g. 01000002         Vendor ID  
 -5, --self-type        LV0/LV1/LV2/APP/ISO/  
                        LDR/NPDRM             SELF Type  
 -A, --self-app-version e.g. 0001000000000000 Application Version  
 -6, --self-fw-version  e.g. 0003004100000000 Firmware Version  
 -7, --self-add-shdrs   TRUE(default)/FALSE   Whether to add ELF shdrs or not.  
 -8, --self-ctrl-flags  32 bytes              Override control flags.  
 -9, --self-cap-flags   32 bytes              Override capability flags.  
 -b, --np-license-type  LOCAL/FREE            License Type  
 -c, --np-app-type      SPRX/EXEC/USPRX/UEXEC App Type (U\* for updates)  
 -f, --np-content-id                          Content ID  
 -l, --np-klicensee     16 bytes              Override klicensee.  
 -g, --np-real-fname    e.g. EBOOT.BIN        Real Filename  
 -j, --np-add-sig       TRUE/FALSE(default)   Whether to add a NP sig. or not.    
 -p, --sys-param-ver    e.g. 00340001         Set sys\_process\_param SDK version.
```

# What was tested to be working fine

As this is the result of reverse engineering, there might be some errors 
here and there.
This is what I have tested. If you have some problems, or incompatibilities
please contact me.

```
	- Info: 
		- SELF 64bits: OK
		- SELF 64bits, NPDRM:  OK
		- SELF 32bits: OK
		- RVK: OK
		- SPP: OK
		
	- Decrypt: 
		- SELF 64bits: OK
		- SELF 64bits, NPDRM:  OK
		- SELF 32bits: OK
		- RVK: OK
		- SPP: OK
		
	- Encrypt: 
		- SELF 64bits: OK
		- SELF 64bits, NPDRM:  OK
		- SELF 32bits: Not tested
		- RVK: N/D
		- SPP: N/D

	- RAF/IDPS/ACT.DAT: OK
	- RIF/IDPS/ACT.DAT: OK
```

Credits
-------

Open PS3 SCE Tool is copyright Spaceman Spiff, and is licensed under the terms of the GPL version 3.0 (see COPYING)
Some segments of the code / files fall under other licenses and/or other authors, as detailed below.

* polarssl/*.h, aes.c & sha1.c is part of Polar SSL (https://polarssl.org/), the code is distributed under the GPL 2.0 or later.
* ec.c, bn.c and some functions under util.c is part of Part of the Fail0verflow's ps3tools, distributed under GPL 2.0 or later
* aes_omac.c was taken from geohot's ps3publictools, distributed under GPL 3.0
* mt19937.c, a pseudo random number generator is a Copyright (C) 1997 - 2002, Makoto Matsumoto and Takuji Nishimura, under GPL license
* types.h, list.c, most part of util.c taken from the pfdtools of flatz

Thanks to D_Skywalk for his useful patches

This code may be freely used and modified for any purpose
providing that this copyright notice is included with it.
Spaceman Spiff makes no warranty for this code, and cannot be held
liable for any real or imagined damage resulting from its use.
Users of this code must verify correctness for their application.
