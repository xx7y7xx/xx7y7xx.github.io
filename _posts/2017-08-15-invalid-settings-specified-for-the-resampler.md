---
layout: post
title: "[IFlyIatSession] 科大讯飞HTML5 API 报错 Invalid settings specified for the resampler"
---

[https://gist.github.com/xxd3vin/c02e55e38dff6bb028dbb4418be00d02](https://gist.github.com/xxd3vin/c02e55e38dff6bb028dbb4418be00d02)

在Vue.js的一个项目中使用到了`IFlyIatSession`接口，但是在路由切换之后再次使用语音的时候出现了如下错误

```
Invalid settings specified for the resampler
```

报错的代码如下，其中`this.fromSampleRate`是`undefined`了

```js
// 这段代码在IFlyIatSession的定义中，寻找recordWorkerCode变量
Resampler.prototype.initialize = function() {
    if (this.fromSampleRate > 0 && this.toSampleRate > 0 && this.channels > 0) {
        ...
    } else {
        throw (new Error("Invalid settings specified for the resampler."))
    }
}
```

这是因为SPA项目中路由切换并不会刷新页面，导致`IFlyIatSession`内部对状态判断出现了错误。

见`iat.all.js`中的代码，通过对全局变量`audioStream`的判断，来尝试复用之前的资源。这个代码在传统的非SPA环境中没有问题，因为页面跳转之后，`audioStream`全局变量就空了，但是在SPA环境下，全局变量仍然存在，但是有部分DOM已经被改写了，如果`IFlyIatSession`判断的不够严谨，就会出现这个错误。

```js
var startRecord = function () {
    /* 写音频接口 或 非首次初始化 则不进行多媒体初始化*/
    if (audioStream == null) {
        initMedia();
        recorderWorker.init();
        return;
    }
...
};
```

解决方案就是手动清理session

```js
if (window.vSession) window.vSession.kill()
window.vSession = fcVoiceInit(this.onVoiceResult)
```

## References

- [html5语音识别后切换界面的陌生问题](http://bbs.xfyun.cn/forum.php?mod=viewthread&tid=12188)