---
layout: post
title: "ImportError: cannot import name 'HtmlXPathSelector' from 'scrapy.selector'"
---

In order to run the `IkeaCrawler` Project ([github.com/Cellebyte/IkeaCrawler](https://github.com/Cellebyte/IkeaCrawler)), I installed Scrapy 2.0.1.
But after I run `scrapy check` to check the project, I got this error.

```
...
  File "/Users/chenyang/source/tmp/IkeaCrawler/ikea/spiders/ikea_spyder.py", line 2, in <module>
    from scrapy.selector import HtmlXPathSelector
ImportError: cannot import name 'HtmlXPathSelector' from 'scrapy.selector' (/Users/chenyang/.pyenv/versions/3.8.0/lib/python3.8/site-packages/scrapy/selector/__init__.py)
```

After searching in the [Scrapy Docs](https://docs.scrapy.org/), I found this API `HtmlXPathSelector` has been deprecated in Scrapy 1.7.0 which is mentioned [here](https://docs.scrapy.org/en/latest/news.html#scrapy-1-7-0-2019-07-18).

So I decide to follow [these steps](/pip.html) to downgrade the Scrapy.

```
$ pip uninstall scrapy
Uninstalling Scrapy-2.0.1:
  Would remove:
    /Users/chenyang/.pyenv/versions/3.8.0/bin/scrapy
    /Users/chenyang/.pyenv/versions/3.8.0/lib/python3.8/site-packages/Scrapy-2.0.1.dist-info/*
    /Users/chenyang/.pyenv/versions/3.8.0/lib/python3.8/site-packages/scrapy/*
Proceed (y/n)? y
  Successfully uninstalled Scrapy-2.0.1
```

```
$ pip install 'scrapy==1.6'
Collecting scrapy==1.6
  Downloading https://files.pythonhosted.org/packages/3e/45/414e87ac8209d537c91575538c5307c20217a6943f555e0ee39f6db4bb0f/Scrapy-1.6.0-py2.py3-none-any.whl (231kB)
     |████████████████████████████████| 235kB 229kB/s
Requirement already satisfied: pyOpenSSL in ./.pyenv/versions/3.8.0/lib/python3.8/site-packages (from scrapy==1.6) (19.1.0)
Requirement already satisfied: w3lib>=1.17.0 in ./.pyenv/versions/3.8.0/lib/python3.8/site-packages (from scrapy==1.6) (1.21.0)
Requirement already satisfied: lxml in ./.pyenv/versions/3.8.0/lib/python3.8/site-packages (from scrapy==1.6) (4.5.0)
Requirement already satisfied: service-identity in ./.pyenv/versions/3.8.0/lib/python3.8/site-packages (from scrapy==1.6) (18.1.0)
Requirement already satisfied: Twisted>=13.1.0 in ./.pyenv/versions/3.8.0/lib/python3.8/site-packages (from scrapy==1.6) (20.3.0)
Requirement already satisfied: cssselect>=0.9 in ./.pyenv/versions/3.8.0/lib/python3.8/site-packages (from scrapy==1.6) (1.1.0)
Requirement already satisfied: six>=1.5.2 in ./.pyenv/versions/3.8.0/lib/python3.8/site-packages (from scrapy==1.6) (1.14.0)
Requirement already satisfied: parsel>=1.5 in ./.pyenv/versions/3.8.0/lib/python3.8/site-packages (from scrapy==1.6) (1.5.2)
Requirement already satisfied: queuelib in ./.pyenv/versions/3.8.0/lib/python3.8/site-packages (from scrapy==1.6) (1.5.0)
Requirement already satisfied: PyDispatcher>=2.0.5 in ./.pyenv/versions/3.8.0/lib/python3.8/site-packages (from scrapy==1.6) (2.0.5)
Requirement already satisfied: cryptography>=2.8 in ./.pyenv/versions/3.8.0/lib/python3.8/site-packages (from pyOpenSSL->scrapy==1.6) (2.8)
Requirement already satisfied: pyasn1 in ./.pyenv/versions/3.8.0/lib/python3.8/site-packages (from service-identity->scrapy==1.6) (0.4.8)
Requirement already satisfied: attrs>=16.0.0 in ./.pyenv/versions/3.8.0/lib/python3.8/site-packages (from service-identity->scrapy==1.6) (19.3.0)
Requirement already satisfied: pyasn1-modules in ./.pyenv/versions/3.8.0/lib/python3.8/site-packages (from service-identity->scrapy==1.6) (0.2.8)
Requirement already satisfied: zope.interface>=4.4.2 in ./.pyenv/versions/3.8.0/lib/python3.8/site-packages (from Twisted>=13.1.0->scrapy==1.6) (5.0.1)
Requirement already satisfied: constantly>=15.1 in ./.pyenv/versions/3.8.0/lib/python3.8/site-packages (from Twisted>=13.1.0->scrapy==1.6) (15.1.0)
Requirement already satisfied: incremental>=16.10.1 in ./.pyenv/versions/3.8.0/lib/python3.8/site-packages (from Twisted>=13.1.0->scrapy==1.6) (17.5.0)
Requirement already satisfied: Automat>=0.3.0 in ./.pyenv/versions/3.8.0/lib/python3.8/site-packages (from Twisted>=13.1.0->scrapy==1.6) (20.2.0)
Requirement already satisfied: hyperlink>=17.1.1 in ./.pyenv/versions/3.8.0/lib/python3.8/site-packages (from Twisted>=13.1.0->scrapy==1.6) (19.0.0)
Requirement already satisfied: PyHamcrest!=1.10.0,>=1.9.0 in ./.pyenv/versions/3.8.0/lib/python3.8/site-packages (from Twisted>=13.1.0->scrapy==1.6) (2.0.2)
Requirement already satisfied: cffi!=1.11.3,>=1.8 in ./.pyenv/versions/3.8.0/lib/python3.8/site-packages (from cryptography>=2.8->pyOpenSSL->scrapy==1.6) (1.14.0)
Requirement already satisfied: setuptools in ./.pyenv/versions/3.8.0/lib/python3.8/site-packages (from zope.interface>=4.4.2->Twisted>=13.1.0->scrapy==1.6) (41.2.0)
Requirement already satisfied: idna>=2.5 in ./.pyenv/versions/3.8.0/lib/python3.8/site-packages (from hyperlink>=17.1.1->Twisted>=13.1.0->scrapy==1.6) (2.9)
Requirement already satisfied: pycparser in ./.pyenv/versions/3.8.0/lib/python3.8/site-packages (from cffi!=1.11.3,>=1.8->cryptography>=2.8->pyOpenSSL->scrapy==1.6) (2.20)
Installing collected packages: scrapy
Successfully installed scrapy-1.6.0
```

## See also

- [pip](/pip.html)
