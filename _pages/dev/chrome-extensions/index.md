---
layout: page
title: Chrome extensions
permalink: /dev/chrome-extensions/index.html
---

## sub pages

- [FAQ](/dev/chrome-extensions/faq.html)

## runtime

runtime [ref](http://stackoverflow.com/a/9916089):

- Extension code (包含[Background Pages](https://developer.chrome.com/extensions/background_pages)): 可以访问全部`chrome.*` API
- Content scripts
  - 有两种加入途径
    - `manifest.json`中的`content_scripts`字段
    - `chrome.tabs.executeScript`
  - 访问权限：
    - 可以访问部分`chrome.*` API
    - 可以访问全部 DOM
    - 不能访问`window`对象，也不能访问任何 frame
- Injected scripts
  - 使用`manifest.json`中的[`web_accessible_resources`](https://developer.chrome.com/extensions/manifest/web_accessible_resources)字段

## Run content scripts both in new pages/tabs and iframes

By default, when `http://kaoqin.ufida.com.cn/query/filltimecard.aspx` page was in a frame of a page, the content scripts will not run.

You could use `all_frames` switch to make sure content scripts running in all pages, and also frames.

This is a sample `manifest.json` coming from [https://github.com/yyssc/filltimecard/blob/master/manifest.json](https://github.com/yyssc/filltimecard/blob/master/manifest.json):

```
  "content_scripts": [
    {
      "matches": ["http://kaoqin.ufida.com.cn/query/filltimecard.aspx"],
      "all_frames": true,
      "js": [
        "fill.js"
      ]
    },
```

## examples

Learn API from this project

- [https://github.com/jparise/chrome-utm-stripper](https://github.com/jparise/chrome-utm-stripper)

## References

- [http://stackoverflow.com/questions/9515704/building-a-chrome-extension-inject-code-in-a-page-using-a-content-script/9517879#9517879](http://stackoverflow.com/questions/9515704/building-a-chrome-extension-inject-code-in-a-page-using-a-content-script/9517879#9517879)
