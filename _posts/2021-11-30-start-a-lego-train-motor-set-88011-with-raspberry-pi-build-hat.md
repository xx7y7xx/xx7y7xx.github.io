---
layout: post
title: "Start a Lego train motor set 88011 with Raspberry Pi Build HAT"
---

## Prepare

After checking the manual [Getting Started with the Raspberry Pi Build HAT (Control LEGO Technic devices with Raspberry Pi)](/attachents/raspberry-pi/getting-started-buildhat.pdf).
We can find it works with [LEGO Train Motor Set 88011](https://www.brickowl.com/catalog/lego-train-motor-set-88011)

## Install `buildhat`

Install the latest released version.

```
$ pip3 install buildhat
```

After some errors, I was try to use the latest `buildhat` version according to this link: [https://github.com/RaspberryPiFoundation/python-build-hat/issues/93#issuecomment-953752451](https://github.com/RaspberryPiFoundation/python-build-hat/issues/93#issuecomment-953752451).
And this repo also mentioned it's under active development.

Install the latest non-released version.

```
$ pip3 install git+https://github.com/RaspberryPiFoundation/python-build-hat.git
```

## Find the motor

Try to get the connected devices.

```py
>>> from buildhat import Hat
>>> hat = Hat()
>>> hat.get()
{'A': {'typeid': 2, 'connected': True, 'name': 'PassiveMotor'}, 'B': {'typeid': -1, 'connected': False, 'name': 'Disconnected'}, 'C': {'typeid': -1, 'connected': False, 'name': 'Disconnected'}, 'D': {'typeid': -1, 'connected': False, 'name': 'Disconnected'}}
```

After checking the connect motor is [`PassiveMotor`](https://github.com/RaspberryPiFoundation/python-build-hat/blob/main/buildhat/motors.py)

## Start the motor

Then let's try to start the motor.

```py
>>> from buildhat import PassiveMotor
>>> a=PassiveMotor('A')
>>> a.run_for_seconds(5)
Traceback (most recent call last):
  File "<pyshell>", line 1, in <module>
AttributeError: 'PassiveMotor' object has no attribute 'run_for_seconds'
>>> a.start()
>>> a.stop()
```

Different motors may have different APIs, so you will find that `run_for_seconds` works for `Motor`, but doesn't work for `PassiveMotor`.

Check the source code to find more APIs related to `PassiveMotor`: [`motors.py`](https://github.com/RaspberryPiFoundation/python-build-hat/blob/main/buildhat/motors.py)

## References

- [Official Website](https://www.raspberrypi.com/products/build-hat/)
- [Raspberry Pi Build HAT Document](https://buildhat.readthedocs.io/en/latest/buildhat/hat.html)
- [Getting Started with the Raspberry Pi Build HAT (Control LEGO Technic devices with Raspberry Pi)](https://cdn-shop.adafruit.com/product-files/5287/getting-started-buildhat.pdf)
