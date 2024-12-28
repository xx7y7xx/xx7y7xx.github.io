---
permalink: /sdr/sdr-raspberry-pi.html
title: SDR Raspberry Pi tools
layout: page
---

## Solution 1 - rtl-sdr

Install the `rtl-sdr` package:

```
sudo apt install rtl-sdr
```

Find the device:

```
$ rtl_test
No supported devices found.
```

Insert the device and run the test again:

```
$ rtl_test

Found 1 device(s):
  0:  Realtek, RTL2838UHIDIR, SN: 00000001

Using device 0: Generic RTL2832U OEM
Detached kernel driver
Found Rafael Micro R820T tuner
Supported gain values (29): 0.0 0.9 1.4 2.7 3.7 7.7 8.7 12.5 14.4 15.7 16.6 19.7 20.7 22.9 25.4 28.0 29.7 32.8 33.8 36.4 37.2 38.6 40.2 42.1 43.4 43.9 44.5 48.0 49.6
[R82XX] PLL not locked!
Sampling at 2048000 S/s.

Info: This tool will continuously read from the device, and report if
samples get lost. If you observe no further output, everything is fine.

Reading samples in async mode...
Allocating 15 zero-copy buffers
lost at least 28 bytes
```

## Soltuion 2 - OpenWebRX

OpenWebRX Raspberry Pi4 Images: https://www.openwebrx.de/download/rpi.php

## See also

- [RTL2832U and Rafael Micro R820T tuner](/sdr/rtl2832u-r820t.html)

## References

- https://www.rtl-sdr.com/v4/
