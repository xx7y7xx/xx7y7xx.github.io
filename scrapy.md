---
layout: page
title: scrapy
---

## Install

Follow the [Python Installation](/python-macos-installation.html) first.

Check the installed or enabled version of Python.

```
$ python --version
Python 3.8.0
$ pip --version
pip 19.2.3 from /Users/chenyang/.pyenv/versions/3.8.0/lib/python3.8/site-packages/pip (python 3.8)
```

Start to install by `pip`.

```
$ pip install scrapy
Collecting scrapy
  Downloading https://files.pythonhosted.org/packages/e0/b7/06c19d7d7f5318ffd1d31d7cd7d944ed9dcf773981c731285350961d9b5c/Scrapy-2.0.1-py2.py3-none-any.whl (242kB)
     |████████████████████████████████| 245kB 615kB/s
Collecting Twisted>=17.9.0 (from scrapy)
  Downloading https://files.pythonhosted.org/packages/4a/b4/4973c7ccb5be2ec0abc779b7d5f9d5f24b17b0349e23240cfc9dc3bd83cc/Twisted-20.3.0.tar.bz2 (3.1MB)
     |████████████████████████████████| 3.1MB 10.9MB/s
Collecting PyDispatcher>=2.0.5 (from scrapy)
  Downloading https://files.pythonhosted.org/packages/cd/37/39aca520918ce1935bea9c356bcbb7ed7e52ad4e31bff9b943dfc8e7115b/PyDispatcher-2.0.5.tar.gz
Collecting protego>=0.1.15 (from scrapy)
  Downloading https://files.pythonhosted.org/packages/db/6e/bf6d5e4d7cf233b785719aaec2c38f027b9c2ed980a0015ec1a1cced4893/Protego-0.1.16.tar.gz (3.2MB)
     |████████████████████████████████| 3.2MB 12.2MB/s
Collecting pyOpenSSL>=16.2.0 (from scrapy)
  Downloading https://files.pythonhosted.org/packages/9e/de/f8342b68fa9e981d348039954657bdf681b2ab93de27443be51865ffa310/pyOpenSSL-19.1.0-py2.py3-none-any.whl (53kB)
     |████████████████████████████████| 61kB 10.8MB/s
Collecting queuelib>=1.4.2 (from scrapy)
  Downloading https://files.pythonhosted.org/packages/4c/85/ae64e9145f39dd6d14f8af3fa809a270ef3729f3b90b3c0cf5aa242ab0d4/queuelib-1.5.0-py2.py3-none-any.whl
Collecting service-identity>=16.0.0 (from scrapy)
  Downloading https://files.pythonhosted.org/packages/e9/7c/2195b890023e098f9618d43ebc337d83c8b38d414326685339eb024db2f6/service_identity-18.1.0-py2.py3-none-any.whl
Collecting cryptography>=2.0 (from scrapy)
  Downloading https://files.pythonhosted.org/packages/6b/4a/ce93178469d4460d6b3a5e648fc1a2f426030f3d30a12d7ed4df73d044de/cryptography-2.8-cp34-abi3-macosx_10_6_intel.whl (1.6MB)
     |████████████████████████████████| 1.6MB 14.0MB/s
Collecting w3lib>=1.17.0 (from scrapy)
  Downloading https://files.pythonhosted.org/packages/6a/45/1ba17c50a0bb16bd950c9c2b92ec60d40c8ebda9f3371ae4230c437120b6/w3lib-1.21.0-py2.py3-none-any.whl
Collecting zope.interface>=4.1.3 (from scrapy)
  Downloading https://files.pythonhosted.org/packages/87/43/fb6d188e05c2637629792b1f4a84cb25de51325448be8d705c8bb2f184ac/zope.interface-5.0.1.tar.gz (214kB)
     |████████████████████████████████| 215kB 14.5MB/s
Collecting cssselect>=0.9.1 (from scrapy)
  Downloading https://files.pythonhosted.org/packages/3b/d4/3b5c17f00cce85b9a1e6f91096e1cc8e8ede2e1be8e96b87ce1ed09e92c5/cssselect-1.1.0-py2.py3-none-any.whl
Collecting lxml>=3.5.0 (from scrapy)
  Downloading https://files.pythonhosted.org/packages/86/e5/3412ef8d7870c4075dcd832298e07f2bfa2c18879aeea5d931f7096f27ba/lxml-4.5.0-cp38-cp38-macosx_10_9_x86_64.whl (4.6MB)
     |████████████████████████████████| 4.6MB 12.9MB/s
Collecting parsel>=1.5.0 (from scrapy)
  Downloading https://files.pythonhosted.org/packages/86/c8/fc5a2f9376066905dfcca334da2a25842aedfda142c0424722e7c497798b/parsel-1.5.2-py2.py3-none-any.whl
Collecting constantly>=15.1 (from Twisted>=17.9.0->scrapy)
  Downloading https://files.pythonhosted.org/packages/b9/65/48c1909d0c0aeae6c10213340ce682db01b48ea900a7d9fce7a7910ff318/constantly-15.1.0-py2.py3-none-any.whl
Collecting incremental>=16.10.1 (from Twisted>=17.9.0->scrapy)
  Downloading https://files.pythonhosted.org/packages/f5/1d/c98a587dc06e107115cf4a58b49de20b19222c83d75335a192052af4c4b7/incremental-17.5.0-py2.py3-none-any.whl
Collecting Automat>=0.3.0 (from Twisted>=17.9.0->scrapy)
  Downloading https://files.pythonhosted.org/packages/dd/83/5f6f3c1a562674d65efc320257bdc0873ec53147835aeef7762fe7585273/Automat-20.2.0-py2.py3-none-any.whl
Collecting hyperlink>=17.1.1 (from Twisted>=17.9.0->scrapy)
  Downloading https://files.pythonhosted.org/packages/7f/91/e916ca10a2de1cb7101a9b24da546fb90ee14629e23160086cf3361c4fb8/hyperlink-19.0.0-py2.py3-none-any.whl
Collecting PyHamcrest!=1.10.0,>=1.9.0 (from Twisted>=17.9.0->scrapy)
  Downloading https://files.pythonhosted.org/packages/40/16/e54cc65891f01cb62893540f44ffd3e8dab0a22443e1b438f1a9f5574bee/PyHamcrest-2.0.2-py3-none-any.whl (52kB)
     |████████████████████████████████| 61kB 15.2MB/s
Collecting attrs>=19.2.0 (from Twisted>=17.9.0->scrapy)
  Downloading https://files.pythonhosted.org/packages/a2/db/4313ab3be961f7a763066401fb77f7748373b6094076ae2bda2806988af6/attrs-19.3.0-py2.py3-none-any.whl
Collecting six (from protego>=0.1.15->scrapy)
  Downloading https://files.pythonhosted.org/packages/65/eb/1f97cb97bfc2390a276969c6fae16075da282f5058082d4cb10c6c5c1dba/six-1.14.0-py2.py3-none-any.whl
Collecting pyasn1 (from service-identity>=16.0.0->scrapy)
  Downloading https://files.pythonhosted.org/packages/62/1e/a94a8d635fa3ce4cfc7f506003548d0a2447ae76fd5ca53932970fe3053f/pyasn1-0.4.8-py2.py3-none-any.whl (77kB)
     |████████████████████████████████| 81kB 12.9MB/s
Collecting pyasn1-modules (from service-identity>=16.0.0->scrapy)
  Downloading https://files.pythonhosted.org/packages/95/de/214830a981892a3e286c3794f41ae67a4495df1108c3da8a9f62159b9a9d/pyasn1_modules-0.2.8-py2.py3-none-any.whl (155kB)
     |████████████████████████████████| 163kB 15.7MB/s
Collecting cffi!=1.11.3,>=1.8 (from cryptography>=2.0->scrapy)
  Downloading https://files.pythonhosted.org/packages/e7/1c/922f632aa04341813b84f30f9b359cf6e8f0d7420a2226604b167643c315/cffi-1.14.0-cp38-cp38-macosx_10_9_x86_64.whl (175kB)
     |████████████████████████████████| 184kB 14.4MB/s
Requirement already satisfied: setuptools in ./.pyenv/versions/3.8.0/lib/python3.8/site-packages (from zope.interface>=4.1.3->scrapy) (41.2.0)
Collecting idna>=2.5 (from hyperlink>=17.1.1->Twisted>=17.9.0->scrapy)
  Downloading https://files.pythonhosted.org/packages/89/e3/afebe61c546d18fb1709a61bee788254b40e736cff7271c7de5de2dc4128/idna-2.9-py2.py3-none-any.whl (58kB)
     |████████████████████████████████| 61kB 14.0MB/s
Collecting pycparser (from cffi!=1.11.3,>=1.8->cryptography>=2.0->scrapy)
  Downloading https://files.pythonhosted.org/packages/ae/e7/d9c3a176ca4b02024debf82342dab36efadfc5776f9c8db077e8f6e71821/pycparser-2.20-py2.py3-none-any.whl (112kB)
     |████████████████████████████████| 112kB 14.6MB/s
Installing collected packages: zope.interface, constantly, incremental, attrs, six, Automat, idna, hyperlink, PyHamcrest, Twisted, PyDispatcher, protego, pycparser, cffi, cryptography, pyOpenSSL, queuelib, pyasn1, pyasn1-modules, service-identity, w3lib, cssselect, lxml, parsel, scrapy
  Running setup.py install for zope.interface ... done
  Running setup.py install for Twisted ... done
  Running setup.py install for PyDispatcher ... done
  Running setup.py install for protego ... done
Successfully installed Automat-20.2.0 PyDispatcher-2.0.5 PyHamcrest-2.0.2 Twisted-20.3.0 attrs-19.3.0 cffi-1.14.0 constantly-15.1.0 cryptography-2.8 cssselect-1.1.0 hyperlink-19.0.0 idna-2.9 incremental-17.5.0 lxml-4.5.0 parsel-1.5.2 protego-0.1.16 pyOpenSSL-19.1.0 pyasn1-0.4.8 pyasn1-modules-0.2.8 pycparser-2.20 queuelib-1.5.0 scrapy-2.0.1 service-identity-18.1.0 six-1.14.0 w3lib-1.21.0 zope.interface-5.0.1
```

Test the installation.

```
$ cd /tmp
$ cat > myspider.py <<EOF
import scrapy

class BlogSpider(scrapy.Spider):
   name = 'blogspider'
   start_urls = ['https://blog.scrapinghub.com']

   def parse(self, response):
       for title in response.css('.post-header>h2'):
           yield {'title': title.css('a ::text').get()}

       for next_page in response.css('a.next-posts-link'):
           yield response.follow(next_page, self.parse)
EOF
$ scrapy runspider myspider.py
```

## Start from an existing project

For example, I just git clone the [github.com/Cellebyte/IkeaCrawler](https://github.com/Cellebyte/IkeaCrawler) project. I want to make sure everything is fine both in this project and my local environment.
So I run the command `scrapy check` to check it.

At the first time there is something wrong. Because this old project was developed with a old Scrapy.

```
...
  File "/Users/chenyang/source/tmp/IkeaCrawler/ikea/spiders/ikea_spyder.py", line 2, in <module>
    from scrapy.selector import HtmlXPathSelector
ImportError: cannot import name 'HtmlXPathSelector' from 'scrapy.selector' (/Users/chenyang/.pyenv/versions/3.8.0/lib/python3.8/site-packages/scrapy/selector/__init__.py)
```

So I downgrade Scrapy in my local machine. Then run the check again.

```
$ scrapy check

----------------------------------------------------------------------
Ran 0 contracts in 0.000s

OK
```

So this time everything is OK now.
