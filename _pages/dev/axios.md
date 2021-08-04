---
layout: page
title: axios
permalink: /dev/axios.html
---

## 现象

当401的时候

但是之前401的时候，`error.response.status`是401

ps: 前提是使用了axios

## 解释

后来用过多次之后发现，只有在跨域被拒绝的时候才会出现`error.response`为`undefined`的情况，如果跨域没有被拒绝或者没有跨域，则401的时候`error.response`有值。

## How to send get request with multiple same param

```
import qs from 'qs'

export const paramsSerializer = params => {
  // How to send get request with multiple same param?
  // https://github.com/axios/axios/issues/709
  // '?foo[]=1&foo[]=2' => '?foo=1&foo=2'
  const indices = false
  // Bad  : {foo:null,bar:''} => '?foo=&bar='
  // Good : {foo:null,bar:''} => '?bar='
  const skipNulls = true
  return qs.stringify(params, { indices, skipNulls })
}

export const getDogs = params =>
  Api.get('/dogs', { params, paramsSerializer })
```
