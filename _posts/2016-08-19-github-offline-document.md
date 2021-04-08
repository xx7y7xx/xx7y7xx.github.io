---
layout: post
title:  "Github offline document"
date:   2016-08-19 09:43:00 +0800
categories: markdown
---

The Internet connection speed for xx is soo slow...

So I decide to serve offline API documents of some open source projects (e.g. node request module).

Quick google, find this http://stackoverflow.com/a/13781363/4685522

Now there are 2 methods to fit this requirement:

- serve `*.md` files directly
- serve `*.html` files (need to generate `*.html` files automatically)

The method bellow is more complexible, so I choose this one.

The tool I choose is https://github.com/joeyespo/grip

```
sudo easy_install pip
pip install grip
```

Prepare projects

```
mkdir ~/source/_libs_
cd _libs_
git clone https://github.com/request/request.git
cd request
grip README.md --export readme.html
python -m SimpleHTTPServer
```

Access http://127.0.0.1:8000/readme.html

At the end I create a offline document project https://github.com/xxd3vin/offline-documents