---
layout: page
title: selenium
---

## Setup for macOS (working machine when in 2018-10-22)

requirements.txt

```
allure-behave==2.4.1
allure-python-commons==2.4.1
behave==1.2.6
mysql-connector-python-rf==2.2.2
PyHamcrest==1.9.0
requests==2.18.4
selenium==3.11.0
urllib3==1.22
pynput==1.4
redis==2.10.6
```

```
pip install -r requirements.txt
```


download chromedriver from [http://chromedriver.storage.googleapis.com/index.html](http://chromedriver.storage.googleapis.com/index.html)

```
mv ~/Downloads/chromedriver /usr/local/bin
chmod +x /usr/local/bin/chromedriver # optional
```