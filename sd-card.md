---
layout: page
title: SD Card
---

## Verify the integrity of a flash/SD card on a Mac

According to [https://www.broes.nl/2012/08/verify-the-integrity-of-a-flash-sd-card-on-a-mac/](https://www.broes.nl/2012/08/verify-the-integrity-of-a-flash-sd-card-on-a-mac/) we could use `f3` to check a SD card

```
 ~  brew install f3
Updating Homebrew...
^C==> Installing dependencies for f3: argp-standalone
==> Installing f3 dependency: argp-standalone
==> Downloading https://homebrew.bintray.com/bottles/argp-standalone-1.3.high_sierra.bot
######################################################################## 100.0%
==> Pouring argp-standalone-1.3.high_sierra.bottle.1.tar.gz
🍺  /usr/local/Cellar/argp-standalone/1.3: 6 files, 72KB
==> Installing f3
==> Downloading https://homebrew.bintray.com/bottles/f3-7.1.high_sierra.bottle.tar.gz
######################################################################## 100.0%
==> Pouring f3-7.1.high_sierra.bottle.tar.gz
🍺  /usr/local/Cellar/f3/7.1: 9 files, 123KB
```


```
$ /usr/local/Cellar/f3/7.1/bin/f3write NO\ NAME
F3 write 7.1
Copyright (C) 2010 Digirati Internet LTDA.
This is free software; see the source for copying conditions.

Free space: 14.63 GB
Creating file 1.h2w ... OK!
Creating file 2.h2w ... OK!
Creating file 3.h2w ... OK!
Creating file 4.h2w ... OK!
Creating file 5.h2w ... OK!
Creating file 6.h2w ... OK!
Creating file 7.h2w ... OK!
Creating file 8.h2w ... OK!
Creating file 9.h2w ... OK!
Creating file 10.h2w ... OK!
Creating file 11.h2w ... OK!
Creating file 12.h2w ... OK!
Creating file 13.h2w ... OK!
Creating file 14.h2w ... OK!
Creating file 15.h2w ... OK!
Free space: 0.00 Byte
Average writing speed: 12.44 MB/s
```

```
$ /usr/local/Cellar/f3/7.1/bin/f3read NO\ NAME
F3 read 7.1
Copyright (C) 2010 Digirati Internet LTDA.
This is free software; see the source for copying conditions.

                  SECTORS      ok/corrupted/changed/overwritten
Validating file 1.h2w ... 2097152/        0/      0/      0
Validating file 2.h2w ... 2097152/        0/      0/      0
Validating file 3.h2w ... 2097152/        0/      0/      0
Validating file 4.h2w ... 2097152/        0/      0/      0
Validating file 5.h2w ... 2097152/        0/      0/      0
Validating file 6.h2w ... 2097152/        0/      0/      0
Validating file 7.h2w ... 2097152/        0/      0/      0
Validating file 8.h2w ... 2097152/        0/      0/      0
Validating file 9.h2w ... 2097152/        0/      0/      0
Validating file 10.h2w ... 2097152/        0/      0/      0
Validating file 11.h2w ... 2097152/        0/      0/      0
Validating file 12.h2w ... 2097152/        0/      0/      0
Validating file 13.h2w ... 2097152/        0/      0/      0
Validating file 14.h2w ... 2097152/        0/      0/      0
Validating file 15.h2w ... 1322112/        0/      0/      0

  Data OK: 14.63 GB (30682240 sectors)
Data LOST: 0.00 Byte (0 sectors)
	       Corrupted: 0.00 Byte (0 sectors)
	Slightly changed: 0.00 Byte (0 sectors)
	     Overwritten: 0.00 Byte (0 sectors)
Average reading speed: 37.26 MB/s
```