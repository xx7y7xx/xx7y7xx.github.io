---
permalink: /sdr/sdr-macos.html
title: SDR macOS tools
layout: page
---

## Install and setup

Install rtl-sdr package.

```sh
$ brew install rtl-sdr
```

Insert device into USB port.

Run test (check the connection to the RTL-SDR device and its performance).

```sh
$ rtl_test # basic test
$ rtl_test -t # specifically performs a full tuner test
```

## gqrx (GUI)

```sh
$ brew install --cask gqrx # https://formulae.brew.sh/cask/gqrx
```

The first time you open the software you have to right-click it on the Icon in the application folder to open it up.

Select "Realtek RTL2838UHIDIR" from the "Device" dropdown.

## rtlsdr-scanner (GUI) (not work)

```sh
$ pip3 install rtlsdr-scanner
$ python3 -m rtlsdr_scanner
```

## SDR++

Download from: https://github.com/AlexandreRouma/SDRPlusPlus/releases

## Try CUI

Listen to the radio

```sh
$ brew install sox # install sox, then can call `play` from command line
$ rtl_fm -f 90100000 -M wbfm -s 200000 -r 48000 - | play -r 48000 -t s16 -L -c 1  -
```

params of rtl_fm:

- `-f 90100000` 90,100,000 - FM 90.1MHz

An example output is something like:

```
Found 1 device(s):
  0:  Realtek, RTL2838UHIDIR, SN: 00000001

Using device 0: Generic RTL2832U OEM

-: (s2)

 File Size: 0
  Encoding: Signed PCM
  Channels: 1 @ 16-bit
Samplerate: 48000Hz
Replaygain: off
  Duration: unknown

In:0.00% 00:00:00.00 [00:00:00.00] Out:0     [      |      ]        Clip:0    Found Rafael Micro R820T tuner
Tuner gain set to automatic.
Tuned to 90316000 Hz.
Oversampling input by: 6x.
Oversampling output by: 1x.
Buffer size: 6.83ms
Sampling at 1200000 S/s.
Output at 200000 Hz.
In:0.00% 00:00:06.14 [00:00:00.00] Out:271k  [  ====|====  ]        Clip:0
```

Beijing Radio Stations (https://zh.wikipedia.org/wiki/北京市广播电台列表)

- 北京文艺广播 87.6
- 音乐之声 90.0
