---
layout: post
title: Chrome console cleared unexpected
---

When use Google Login API (google-api-javascript-client or react-google-login)

It will insert some `<iframe>` in DOM.

We can see logs in Console:

```
Navigated to https://accounts.google.com/o/oauth2/iframe
Navigated to https://accounts.google.com/o/oauth2/postmessageRelay
```

In Chrome 64/65, this will cause a console clearing.

Someone had report this bug to google-api-javascript-client. And they mentioned this is a issue of Chrome, not the library itself.

[https://github.com/google/google-api-javascript-client/issues/394](https://github.com/google/google-api-javascript-client/issues/394)

Someone had report this issue in Google Product Forums

[https://productforums.google.com/forum/#!topic/chrome/NIdgxE4UnGQ](https://productforums.google.com/forum/#!topic/chrome/NIdgxE4UnGQ)

And a bug had been created in Chroumium Issue List

[https://bugs.chromium.org/p/chromium/issues/detail?id=823894](https://bugs.chromium.org/p/chromium/issues/detail?id=823894)

## Reproduce

You can access a website, open a console, write something like `console.log('hello')`.

Then open the "Elements" tab in Devtools, and add `<iframe src="https://accounts.google.com/o/oauth2/iframe"></iframe>` to DOM.

After you click Ctrl+Enter/Command+Enter, you will see the console has been cleared.