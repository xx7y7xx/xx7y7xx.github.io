---
layout: page
title: Capture packets on iOS
permalink: /dev/ios-capture-packets.html
---

Date: 2020-07-16

Install XCode first.

Follow steps in [https://www.wikihow.com/Obtain-the-Identifier-Number-(UDID)-for-an-iPhone,-iPod-or-iPad](<https://www.wikihow.com/Obtain-the-Identifier-Number-(UDID)-for-an-iPhone,-iPod-or-iPad>) to get the UDID.

```
$ rvictl -s b0e...2b1
```

## See also

- [scapy](/2020/07/16/scapy.html)

## References

- [https://developer.apple.com/documentation/network/recording_a_packet_trace](https://developer.apple.com/documentation/network/recording_a_packet_trace)
- [https://medium.com/@MikeFurtak/go-deep-on-ios-packet-analysis-6a7542eeffb3](https://medium.com/@MikeFurtak/go-deep-on-ios-packet-analysis-6a7542eeffb3)
- [https://www.wikihow.com/Obtain-the-Identifier-Number-(UDID)-for-an-iPhone,-iPod-or-iPad](<https://www.wikihow.com/Obtain-the-Identifier-Number-(UDID)-for-an-iPhone,-iPod-or-iPad>)
