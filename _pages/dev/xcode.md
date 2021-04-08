---
layout: page
title: Xcode
permalink: /dev/zsh/xcode.html
---

## Uninstall

Remove the App first `/Applications/Xcode.app`

Then remove other related files which size is large.

```
$ du -sh ~/Library/Developer/Xcode
3.2G	/Users/chenyang/Library/Developer/Xcode
$ du -sh ~/Library/Developer/CoreSimulator
 12G	/Users/chenyang/Library/Developer/CoreSimulator
```

```
$ mv ~/Library/Caches/com.apple.dt.Xcode /tmp
$ mv ~/Library/Developer/Xcode /tmp
$ mv ~/Library/Developer/CoreSimulator /tmp
```

Ref: [https://stackoverflow.com/questions/31011062/how-to-completely-uninstall-xcode-and-clear-all-settings](https://stackoverflow.com/questions/31011062/how-to-completely-uninstall-xcode-and-clear-all-settings)
