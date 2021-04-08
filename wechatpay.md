---
layout: page
title: wechatpay
---

## 测试 notify_url

```
$ curl -X POST -H "Content-Type: text/xml" -d '<xml>
  <appid><![CDATA[wx7065330377b79c60]]></appid>
  <bank_type><![CDATA[ICBC_DEBIT]]></bank_type>
  <cash_fee>1</cash_fee>
  <fee_type><![CDATA[CNY]]></fee_type>
  <is_subscribe><![CDATA[N]]></is_subscribe>
  <mch_id><![CDATA[1272242000]]></mch_id>
  <nonce_str><![CDATA[MqswD8mgVds6pfb0aWkaSBQ1DHuHD8b0]]></nonce_str>
  <openid><![CDATA[otKjSjnDI8berNLVGHvRyRf6aJp0]]></openid>
  <out_trade_no><![CDATA[805754f0f78b11e5b4a30fb5e5f1f0d0]]></out_trade_no>
  <result_code><![CDATA[SUCCESS]]></result_code>
  <return_code><![CDATA[SUCCESS]]></return_code>
  <sign><![CDATA[BE417560245271F9DB8EA0BFAE2D9FE0]]></sign>
  <time_end><![CDATA[20160401142858]]></time_end>
  <total_fee>1</total_fee>
  <trade_type><![CDATA[JSAPI]]></trade_type>
  <transaction_id><![CDATA[4001482001201604014454778410]]></transaction_id>
  </xml>' http://wy.ke.cc/_payment/wechat/notify.html
```

- `transaction_id` 微信内部的交易 ID
- `out_trade_no` 是之前创建交易时候网站方生成的自己的 ID

## 统一下单 请求参数说明

https://pay.weixin.qq.com/wiki/doc/api/jsapi.php?chapter=9_1

需要注意的是`out_trade_no`是`String(32)`，所以对于类似`e00335f0-0c07-11e6-a968-3d18a416fbc8`这样的 UUID 就会超长。
