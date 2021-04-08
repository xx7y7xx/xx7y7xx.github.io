---
layout: post
title: JavaScript download file with JWT token
---

## AWS S3 way

### Step 1: AJAX to get a url with auth param

Request summary

```
Request URL: https://ap-XXXX-1.console.aws.amazon.com/s3/batchOpsServlet-proxy
Request Method: POST
Status Code: 200 OK
Remote Address: aa.bb.cc.dd:443
Referrer Policy: no-referrer-when-downgrade
```

Request header

```http
Accept: application/json, text/plain, */*
Accept-Encoding: gzip, deflate, br
Accept-Language: en-US
Cache-Control: no-cache
Connection: keep-alive
Content-Length: 284
Content-Type: application/json;charset=UTF-8
Cookie: aws-addr=...
Host: ap-XXXX-1.console.aws.amazon.com
Origin: https://s3.console.aws.amazon.com
Pragma: no-cache
Referer: https://s3.console.aws.amazon.com/s3/object/x/y/z/a/b/c.txt?region=ap-XXXX-1&tab=overview
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.181 Safari/537.36
X-Amazon-S3Console-Operation: GeneratePresignedUrl
```

Response body

```json
{
  "presignedUrl": "https://s3.ap-XXXX-1.amazonaws.com/x/y/z/a/b/c.txt?response-content-disposition=attachment&X-Amz-Security-Token=...&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=...&X-Amz-SignedHeaders=host&X-Amz-Expires=300&X-Amz-Credential=...&X-Amz-Signature=...",
  "requestStatus": "success"
}
```

### Step 2: Browser redirect to download this file

```js
window.location.href = response.data.presignedUrl
```

The original source code (https://xxxx.cloudfront.net/js/s3_console_Prodxxxx.gz.js:formatted)

```js
function b(z, y, x) {
    var w = d.getCurrentBucket();
    var v = new l(h,a);
    return s(z, w, y, v, x).then(function u(A) {
        m.location.href = A.data.presignedUrl;
        return t.resolve(A)
    })
}
```