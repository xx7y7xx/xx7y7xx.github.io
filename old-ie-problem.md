---
layout: page
---
## 如果在ajax请求成功的事件中，调用window.location会不工作

问题描述：window.location doesn't work after an AJAX request in Internet Explorer

比如 $.post() 成功的事件 success 中，想进行跳转，在IE8下就会遇到问题。

http://stackoverflow.com/questions/5299076/window-location-doesnt-work-after-an-ajax-request-in-internet-explorer

可以修改IE的安全限制。