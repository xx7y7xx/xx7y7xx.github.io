---
layout: page
title: Text to speech
---

## macOS command line

```
$ say -v Alex "Hello" -r 200
```

Save to file

```
$ say -v Alex -r 200 "Hello" -o test.aiff
```

Read file

```
$ say -v Alex -r 200 -f a.txt -o test-a.aiff
```

Listen

```
$ open test-a.aiff
```

Convert to mp3

```
$ lame -m m test-a.aiff test-a.mp3
```
