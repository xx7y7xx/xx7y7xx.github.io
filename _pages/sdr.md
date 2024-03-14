---
permalink: /sdr.html
title: SDR (Software-defined radio)
layout: page
---

# SDR Guide

## Info

device name: DVB-T+FM+DAB (820T2 & SDR)

device: RTL2832U+R820T2

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

## Try GUI

First try rtlsdr-scanner.

```sh
$ pip3 install rtlsdr-scanner
```

How to run

```sh
$ python3 -m rtlsdr_scanner
```

## Try CUI

Listen to the radio

```sh
$ rtl_fm -f 90100000 -M wbfm -s 200000 -r 48000 - | play -r 48000 -t s16 -L -c 1  -
```
