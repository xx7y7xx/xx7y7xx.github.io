---
layout: page
title: pip
---

## Downgrade a package to a specific version

For example, I found some runtime error caused by using deprecated APIs. So I decide to downgrade the Scrapy.

First uninstall Scrapy.

```
$ pip uninstall scrapy
```

Then install the old version 1.6

```
$ pip install 'scrapy==1.6'
Collecting scrapy==1.6
...
Installing collected packages: scrapy
Successfully installed scrapy-1.6.0
```

For more detail when running the command, you could check [this post](/2020/03/28/importerror-cannot-import-name-htmlxpathselector-from-scrapyselector.html).

## See also

- [Python](/python.html)
