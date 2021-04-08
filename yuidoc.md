---
title: yuidoc
---

## ubuntu 12.04 installation

```
$ sudo apt-get install npm
$ ln -s /usr/bin/nodejs /usr/bin/node
$ sudo npm -g install yuidocjs
```

## sample config file

```json
{
    "name": "sample API references",
    "description": "sample description",
    "version": "0.2",
    "url": "http://127.0.0.1/sample",
    "options": {
        "paths": "/source/sample",
        "outdir": "/www/sample"
    }
}
```
