---
layout: page
title: ESP32S3 MicroPython
permalink: /dev/esp32/index.html
---

## Install `esptool.py`

```
pip install esptool
```

## Erase the flash memory on the ESP32S3:

```
$ esptool.py --chip esp32s3 erase_flash
esptool.py v4.8.1
Found 2 serial ports
Serial port /dev/cu.usbserial-210
Connecting....
Chip is ESP32-S3 (QFN56) (revision v0.2)
Features: WiFi, BLE, Embedded PSRAM 8MB (AP_3v3)
Crystal is 40MHz
MAC: 8c:bf:ea:1b:89:b0
Uploading stub...
Running stub...
Stub running...
Erasing flash (this may take a while)...
Chip erase completed successfully in 19.6s
Hard resetting via RTS pin...
```

Download fireware for ESP32-S3 chip: https://micropython.org/download/ESP32_GENERIC_S3/

IMPORTANT: You should download the `bin` file format.

IMPORTANT: You should use `-z 0` to flash start address from 0.

```
$ esptool.py --chip esp32s3 --port /dev/cu.usbserial-210 --baud 460800 write_flash -z 0 ESP32_GENERIC_S3-20241129-v1.24.1.bin
esptool.py v4.8.1
Serial port /dev/cu.usbserial-210
Connecting....
Chip is ESP32-S3 (QFN56) (revision v0.2)
Features: WiFi, BLE, Embedded PSRAM 8MB (AP_3v3)
Crystal is 40MHz
MAC: 8c:bf:ea:1b:89:b0
Uploading stub...
Running stub...
Stub running...
Changing baud rate to 460800
Changed.
Configuring flash size...
Flash will be erased from 0x00000000 to 0x00195fff...
Compressed 1659056 bytes to 1086018...
Wrote 1659056 bytes (1086018 compressed) at 0x00000000 in 28.0 seconds (effective 474.7 kbit/s)...
Hash of data verified.

Leaving...
Hard resetting via RTS pin...
```

Disconnect and Reconnect the Board.

Use Serial Monitor to verify that the firmware has been successfully flashed and is running,

```
screen /dev/cu.usbserial-210 115200
```

Write `help()` to check output.

```
>>> help()
Welcome to MicroPython on the ESP32!

For online docs please visit http//docs.micropython.org/
```

How to exit screen:

1. Press Ctrl + A to issue a command.
2. Press K to kill the current screen session.
3. Press Y to confirm.

## FAQ1: invalid header 0xffffffff

Lots of errors in `screen` command.

```
invalid header 0xffffffff
invalid header 0xffffffff
invalid header 0xffffffff
...
```

The root cause: https://stackoverflow.com/questions/71300752/espressif-esp32-s3-wroom-1-micropython-invalid-header-0xffffffff

Read the flash instruction carefully:

> From then on program the firmware starting at address 0:

## See also

- [idf.py](/dev/esp32/idf.py.html)
