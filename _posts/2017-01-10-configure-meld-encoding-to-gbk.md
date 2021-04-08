---
layout: post
title: Configure Meld Encoding to GBK
---

Get current setting for Meld

```
$ gsettings get org.gnome.meld detect-encodings
['utf8']
```

Add GBK to setting

```
$ gsettings set org.gnome.meld detect-encodings "['utf8', 'gbk']"
```

Get current setting for Meld

```
$ gsettings get org.gnome.meld detect-encodings
['utf8', 'gbk']
```