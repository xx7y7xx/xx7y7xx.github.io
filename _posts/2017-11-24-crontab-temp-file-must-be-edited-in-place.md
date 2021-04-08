---
layout: post
title: "crontab: temp file must be edited in place"
---

```
$ echo $EDITOR
neovim
$ crontab -e
```

```
* * * * * date >> /tmp/xx_timestamps.log
```

after saving

```
crontab: temp file must be edited in place
```

change `EDITOR` to `vim` will fix this issue

```
$ EDITOR=vim crontab -e
```