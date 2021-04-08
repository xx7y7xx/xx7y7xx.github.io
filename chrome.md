---
layout: page
title: Chrome
---

## Evaluate and validate XPath/CSS selectors in Chrome Developer Tools

### From Elements panel

In "Elements" panel, Ctrl + F to open search box, input some CSS selector, like:

```
th.table-column-jine
```

![](/attachments/screenshot_20170304_002.jpg)

### From Console panel

In "Console" panel, use `$$()` function to select in DOM:

```
$$('th.table-column-name')
```

![](/attachments/screenshot_20170304_001.jpg)

refs: [http://yizeng.me/2014/03/23/evaluate-and-validate-xpath-css-selectors-in-chrome-developer-tools/](http://yizeng.me/2014/03/23/evaluate-and-validate-xpath-css-selectors-in-chrome-developer-tools/)

## devtools

### Network

filter:

支持：

- `method:` 比如`method:POST`

## bug

### string template literal 导致 devtools 中语法高亮错误

- [https://stackoverflow.com/questions/40864026/chrome-dev-tools-issue-with-es6-string-literals-typescript](https://stackoverflow.com/questions/40864026/chrome-dev-tools-issue-with-es6-string-literals-typescript)
- [https://bugs.chromium.org/p/chromium/issues/detail?id=659515](https://bugs.chromium.org/p/chromium/issues/detail?id=659515)

## Net-internals

`chrome://net-internals/#sockets`

## Shortcut

What's the keyboard shortcut to open my homepage

Cmd + Shift + H

Refer: [https://productforums.google.com/forum/#!topic/chrome/bjs8Udmnrrs](https://productforums.google.com/forum/#!topic/chrome/bjs8Udmnrrs)

## How to remove specific autofill entries from Google Chrome Autofill Suggestions?

Step 1 - For example, click in the "Username" field/input box and press the down arrow (this will bring up a list of remembered "username" auto-fill entries)

Step 2 - Use the down arrow key to highlight the username (auto-fill entry) you want to delete

Step 3 - Press keys according to different OS:

Mac: Shift + FN + Delete
Windows: Shift + Delete
Chromebook / Chrome OS: Alt + Shift + Delete

ref: [How to delete SPECIFIC autofill entries from Google Chrome?](https://superuser.com/a/1294412), [How to Delete Specific Chrome Autofill Suggestions](http://osxdaily.com/2018/07/20/how-delete-chrome-autofill-suggetsions/)

## See also

- [Headless Chrome](/headless_chrome.html)
- [Chrome extensions](/dev/chrome-extensions/index.html)
