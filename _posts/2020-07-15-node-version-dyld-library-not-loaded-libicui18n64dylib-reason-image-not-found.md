---
layout: post
title: "node --version | dyld: Library not loaded libicui18n.64.dylib | Reason: image not found"
---

## Error

```
$ node --version
dyld: Library not loaded: /usr/local/opt/icu4c/lib/libicui18n.64.dylib
  Referenced from: /usr/local/bin/node
  Reason: image not found
[1]    27950 abort      node --version
```

## Solution

Upgrade Node with Homebrew

```
$ brew update
```

```
$ brew upgrade
```

```
$ node --version
v10.21.0
```

## References

- [node --version -- dyld: Library not loaded libicui18n.59.dylib - image not found](/2018/04/21/node-version-dyld-library-not-loaded-libicui18n-59-dylib-image-not-found.html)
