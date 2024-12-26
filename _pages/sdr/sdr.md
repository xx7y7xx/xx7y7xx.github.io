---
permalink: /sdr/sdr.html
title: SDR (Software-defined radio)
layout: page
---

# SDR Guide

## Info

device name: DVB-T+FM+DAB (820T2 & SDR)

device: RTL2832U+R820T2

## Install tools

[SDR macOS](sdr-macos.html)

Find more tools: https://www.rtl-sdr.com/v4/

## Airplane (ADS-B)

### "Dump1090 Mac Server"(GUI) + ?

- Download https://github.com/mxswd/dump1090-mac-app
- Start "Dump1090 Mac Server"
- ...

### "rtl_tcp" + "Cocoa1090"

Download "Cocoa1090" from https://www.blackcatsystems.com/software/cocoa1090.html

```sh
$ rtl_tcp
```

Run "Cocoa1090".

## 民用对讲机

公众对讲机（民用对讲机）：409-410MHZ

Start gqrx.

Mode change to "NFM" or "Narrow FM".

Frequency change to 409MHz.

## See also

- [SDR Train Tracking](/sdr/sdr-train.html)

## References

- 无线电工作手册 - 2.3 铁路专用通信系统 https://www.kancloud.cn/palwin/jianceshouce/284723 (https://docs.google.com/document/d/1RB6zF70guJFb0iqZ2l9Q8U390u6Ws1osJMCfxU-l1j0/edit)
- https://osmocom.org/projects/rtl-sdr/wiki
- gqrx
  - https://danielpocock.com/quickstart-sdr-ham-radio-gqrx-gnu-radio/
  - https://www.turais.de/install-gqrx-in-mac-os-x/
- ADS-B 信号跟踪 - https://pdf.hanspub.org/CSA20220800000_13646785.pdf
