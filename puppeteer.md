---
layout: page
title: puppeteer
---

## skip the chromium download when installing puppeteer

```
set PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
npm i puppeteer -S
```

```js
const browser = await puppeteer.launch({
  args: ['--no-sandbox', '--disable-setuid-sandbox'],
  headless: false,
  executablePath: '/Applications/Chromium.app/Contents/MacOS/Chromium',
});
```

You should install [Chromium](/macOS.html#install-chromium) manually.

## Alternatives

Golang:
- [chromedp](https://github.com/chromedp/chromedp) - High-level actions and tasks for driving browsers using the Chrome DevTools Protocol in Go

## See also

- [Headless Chrome](/headless-chrome.html)

## References

- [github.com/GoogleChrome/puppeteer](https://github.com/GoogleChrome/puppeteer)