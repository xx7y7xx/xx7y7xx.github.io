---
layout: post
title: Test harddisk speed on Ubuntu
---

## FIO

Install FIO

```
$ sudo apt-get install libaio-dev
$ cd /tmp/
$ wget https://github.com/Crowd9/Benchmark/raw/master/fio-2.0.9.tar.gz
$ tar xf fio*
$ cd fio*
$ make
```

## Disk 1

To check which SATA revision you are using right now type the following:

```
$ dmesg | grep -i sata
[    0.242494] pci 0000:00:11.0: set SATA to AHCI mode
[    2.236498] ahci 0000:00:11.0: AHCI 0001.0200 32 slots 4 ports 6 Gbps 0xf impl SATA mode
[    2.243875] ata1: SATA max UDMA/133 abar m1024@0xfe7ffc00 port 0xfe7ffd00 irq 19
[    2.243878] ata2: SATA max UDMA/133 abar m1024@0xfe7ffc00 port 0xfe7ffd80 irq 19
[    2.243881] ata3: SATA max UDMA/133 abar m1024@0xfe7ffc00 port 0xfe7ffe00 irq 19
[    2.243883] ata4: SATA max UDMA/133 abar m1024@0xfe7ffc00 port 0xfe7ffe80 irq 19
[    2.567019] ata1: SATA link down (SStatus 0 SControl 300)
[    2.567046] ata2: SATA link down (SStatus 0 SControl 300)
[    2.567072] ata4: SATA link down (SStatus 0 SControl 300)
[    2.738982] ata3: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
```

To see which SATA revision are supported by your harddisk, type the following:

```
$ sudo hdparm -iI /dev/sdb

/dev/sdb:

 Model=Samsung SSD 840 Series, FwRev=DXT06B0Q, SerialNo=S14CNEACA00499L
 Config={ Fixed }
 RawCHS=16383/16/63, TrkSize=0, SectSize=0, ECCbytes=0
 BuffType=unknown, BuffSize=unknown, MaxMultSect=16, MultSect=off
 CurCHS=16383/16/63, CurSects=16514064, LBA=yes, LBAsects=234441648
 IORDY=on/off, tPIO={min:120,w/IORDY:120}, tDMA={min:120,rec:120}
 PIO modes:  pio0 pio1 pio2 pio3 pio4 
 DMA modes:  mdma0 mdma1 mdma2 
 UDMA modes: udma0 udma1 *udma2 udma3 udma4 udma5 udma6 
 AdvancedPM=no WriteCache=enabled
 Drive conforms to: unknown:  ATA/ATAPI-2,3,4,5,6,7

 * signifies the current active mode


ATA device, with non-removable media
	Model Number:       Samsung SSD 840 Series                  
	Serial Number:      S14CNEACA00499L     
	Firmware Revision:  DXT06B0Q
	Media Serial Num:   00000000000000000000
	Transport:          Serial, ATA8-AST, SATA 1.0a, SATA II Extensions, SATA Rev 2.5, SATA Rev 2.6, SATA Rev 3.0
Standards:
	Used: unknown (minor revision code 0x0039) 
	Supported: 9 8 7 6 5 
	Likely used: 9
Configuration:
	Logical		max	current
	cylinders	16383	16383
	heads		16	16
	sectors/track	63	63
	--
	CHS current addressable sectors:   16514064
	LBA    user addressable sectors:  234441648
	LBA48  user addressable sectors:  234441648
	Logical  Sector size:                   512 bytes
	Physical Sector size:                   512 bytes
	Logical Sector-0 offset:                  0 bytes
	device size with M = 1024*1024:      114473 MBytes
	device size with M = 1000*1000:      120034 MBytes (120 GB)
	cache/buffer size  = unknown
	Nominal Media Rotation Rate: Solid State Device
Capabilities:
	LBA, IORDY(can be disabled)
	Queue depth: 32
	Standby timer values: spec'd by Standard, no device specific minimum
	R/W multiple sector transfer: Max = 16	Current = 16
	DMA: mdma0 mdma1 mdma2 udma0 udma1 *udma2 udma3 udma4 udma5 udma6 
	     Cycle time: min=120ns recommended=120ns
	PIO: pio0 pio1 pio2 pio3 pio4 
	     Cycle time: no flow control=120ns  IORDY flow control=120ns
Commands/features:
	Enabled	Supported:
	   *	SMART feature set
	    	Security Mode feature set
	   *	Power Management feature set
	   *	Write cache
	   *	Look-ahead
	   *	Host Protected Area feature set
	   *	WRITE_BUFFER command
	   *	READ_BUFFER command
	   *	NOP cmd
	   *	DOWNLOAD_MICROCODE
	    	SET_MAX security extension
	   *	48-bit Address feature set
	   *	Device Configuration Overlay feature set
	   *	Mandatory FLUSH_CACHE
	   *	FLUSH_CACHE_EXT
	   *	SMART error logging
	   *	SMART self-test
	   *	General Purpose Logging feature set
	   *	WRITE_{DMA|MULTIPLE}_FUA_EXT
	   *	64-bit World wide name
	    	Write-Read-Verify feature set
	   *	WRITE_UNCORRECTABLE_EXT command
	   *	{READ,WRITE}_DMA_EXT_GPL commands
	   *	Segmented DOWNLOAD_MICROCODE
	   *	Gen1 signaling speed (1.5Gb/s)
	   *	Gen2 signaling speed (3.0Gb/s)
	   *	Gen3 signaling speed (6.0Gb/s)
	   *	Native Command Queueing (NCQ)
	   *	Phy event counters
	   *	READ_LOG_DMA_EXT equivalent to READ_LOG_EXT
	    	DMA Setup Auto-Activate optimization
	    	Device-initiated interface power management
	    	Asynchronous notification (eg. media change)
	   *	Software settings preservation
	    	Device Sleep (DEVSLP)
	   *	SMART Command Transport (SCT) feature set
	   *	SCT Write Same (AC2)
	   *	SCT Error Recovery Control (AC3)
	   *	SCT Features Control (AC4)
	   *	SCT Data Tables (AC5)
	   *	SET MAX SETPASSWORD/UNLOCK DMA commands
	   *	WRITE BUFFER DMA command
	   *	READ BUFFER DMA command
	   *	Data Set Management TRIM supported (limit 8 blocks)
	   *	Deterministic read ZEROs after TRIM
Security: 
	Master password revision code = 65534
		supported
	not	enabled
	not	locked
		frozen
	not	expired: security count
		supported: enhanced erase
	2min for SECURITY ERASE UNIT. 2min for ENHANCED SECURITY ERASE UNIT. 
Logical Unit WWN Device Identifier: 5002538550000c11
	NAA		: 5
	IEEE OUI	: 002538
	Unique ID	: 550000c11
Checksum: correct
```

Test reading speed:

```
$ sudo hdparm -Tt /dev/sdb

/dev/sdb:
 Timing cached reads:   7930 MB in  2.00 seconds = 3968.18 MB/sec
 Timing buffered disk reads: 160 MB in  3.00 seconds =  53.27 MB/sec
```

```
$ sudo hdparm -v /dev/sdb

/dev/sdb:
 multcount     =  0 (off)
 IO_support    =  0 (default) 
 readonly      =  0 (off)
 readahead     = 256 (on)
 geometry      = 14593/255/63, sectors = 234441648, start = 0
```

Test writing speed:

```
$ dd if=/dev/zero of=/tmp/output bs=8k count=10k; rm -f /tmp/output10240+0 records in
10240+0 records out
83886080 bytes (84 MB, 80 MiB) copied, 0.100284 s, 836 MB/s
```

Random read/write performance

```
$ ./fio --randrepeat=1 --ioengine=libaio --direct=1 --gtod_reduce=1 --name=test --filename=test --bs=4k --iodepth=64 --size=4G --readwrite=randrw --rwmixread=75
test: (g=0): rw=randrw, bs=4K-4K/4K-4K, ioengine=libaio, iodepth=64
fio-2.0.9
Starting 1 process
Jobs: 1 (f=1): [m] [100.0% done] [13628K/4300K /s] [3407 /1075  iops] [eta 00m:00s]
test: (groupid=0, jobs=1): err= 0: pid=10686: Fri Mar 10 01:13:46 2017
  read : io=3073.3MB, bw=12040KB/s, iops=3009 , runt=261382msec
  write: io=1022.8MB, bw=4006.7KB/s, iops=1001 , runt=261382msec
  cpu          : usr=3.06%, sys=23.46%, ctx=904065, majf=0, minf=5
  IO depths    : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=0.1%, 32=0.1%, >=64=100.0%
     submit    : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
     complete  : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.1%, >=64=0.0%
     issued    : total=r=786758/w=261818/d=0, short=r=0/w=0/d=0

Run status group 0 (all jobs):
   READ: io=3073.3MB, aggrb=12039KB/s, minb=12039KB/s, maxb=12039KB/s, mint=261382msec, maxt=261382msec
  WRITE: io=1022.8MB, aggrb=4006KB/s, minb=4006KB/s, maxb=4006KB/s, mint=261382msec, maxt=261382msec

Disk stats (read/write):
  sdb: ios=786091/262213, merge=448/484, ticks=14135948/2495016, in_queue=16632148, util=100.00%
```

## Disk 2

```
$ sudo hdparm -Tt /dev/sdb1 

/dev/sdb1:
 Timing cached reads:   12562 MB in  2.00 seconds = 6283.40 MB/sec
 Timing buffered disk reads: 712 MB in  3.00 seconds = 237.18 MB/sec
```

## References

- [http://askubuntu.com/questions/330130/change-disk-ssd-how-check-which-sata-version-is-supported](http://askubuntu.com/questions/330130/change-disk-ssd-how-check-which-sata-version-is-supported)
- [http://askubuntu.com/questions/87035/how-to-check-hard-disk-performance](http://askubuntu.com/questions/87035/how-to-check-hard-disk-performance)
- [https://www.binarylane.com.au/support/solutions/articles/1000055889-how-to-benchmark-disk-i-o](https://www.binarylane.com.au/support/solutions/articles/1000055889-how-to-benchmark-disk-i-o)