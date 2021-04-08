---
layout: page
title: expressjs
---

## Express behind proxies

```js
// NGINX/Apache is locate at the same server
app.set('trust proxy', 'loopback');
```

refs: [https://expressjs.com/en/guide/behind-proxies.html](https://expressjs.com/en/guide/behind-proxies.html)