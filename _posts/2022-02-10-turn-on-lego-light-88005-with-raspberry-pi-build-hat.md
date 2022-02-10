---
layout: post
title: "Turn on LEGO® Light 88005 with Raspberry Pi Build HAT"
---

## Upgrade `buildhat` to v0.5.7

After checking the release notes of buildhat, light is supported in v0.5.7.

But my current is v0.5.6

```
pi@raspberrypi:~ $ pip3 show buildhat
Name: buildhat
Version: 0.5.6
```

Start to upgrade.

```
pi@raspberrypi:~ $ pip3 install buildhat --upgrade
Looking in indexes: https://pypi.org/simple, https://www.piwheels.org/simple
Collecting buildhat
  Downloading https://files.pythonhosted.org/packages/35/6d/b0f41cce0b981f17617908d059cf71c3e3cf1687470e59d59e3794859557/buildhat-0.5.7-py3-none-any.whl (52kB)
    100% |████████████████████████████████| 61kB 818kB/s
Requirement already satisfied, skipping upgrade: gpiozero in /usr/lib/python3/dist-packages (from buildhat) (1.5.1)
Requirement already satisfied, skipping upgrade: pyserial in /usr/lib/python3/dist-packages (from buildhat) (3.4)
Installing collected packages: buildhat
  Found existing installation: buildhat 0.5.6
    Uninstalling buildhat-0.5.6:
      Successfully uninstalled buildhat-0.5.6
Successfully installed buildhat-0.5.7
```

## Find the device

...

Cannot find device because this bug: [https://github.com/RaspberryPiFoundation/python-build-hat/issues/105#issuecomment-992655757](https://github.com/RaspberryPiFoundation/python-build-hat/issues/105#issuecomment-992655757)

## References

- [https://buildhat.readthedocs.io/en/latest/buildhat/light.html](https://buildhat.readthedocs.io/en/latest/buildhat/light.html)
- [https://github.com/RaspberryPiFoundation/python-build-hat](https://github.com/RaspberryPiFoundation/python-build-hat)
