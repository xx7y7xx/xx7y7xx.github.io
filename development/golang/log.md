---
layout: page
title: log
---

## Compare `%#v` and `#+v`

|                      | %#v | %+v |
| :------------------- | :-- | --- |
| Print type           | Yes | No  |
| Print value for time | No  | Yes |

## `%#v` output example

```
[&http.Request{Method:"POST", URL:(*url.URL)(0xc004628f80), Proto:"HTTP/1.1", ProtoMajor:1, ProtoMinor:1, Header:http.Header{"Accept":[]string{"*/*"}, "Accept-Encoding":[]string{"gzip, deflate, br"}, "Cache-Control":[]string{"no-cache"}, "Connection":[]string{"keep-alive"}, "Content-Length":[]string{"214"}, "Content-Type":[]string{"application/json"}, "Postman-Token":[]string{"b7569071-96b2-4845-bcb8-e7ed00435b44"}, "User-Agent":[]string{"PostmanRuntime/7.26.1"}}, Body:(*http.body)(0xc0041f5d00), GetBody:(func() (io.ReadCloser, error))(nil), ContentLength:214, TransferEncoding:[]string(nil), Close:false, Host:"localhost:8080", Form:url.Values{}, PostForm:url.Values{}, MultipartForm:(*multipart.Form)(nil), Trailer:http.Header(nil), RemoteAddr:"localhost:22032", RequestURI:"/foo/bar", TLS:(*tls.ConnectionState)(nil), Cancel:(<-chan struct {})(nil), Response:(*http.Response)(nil), ctx:(*context.valueCtx)(0xc0284bfd40)}]

format =>

[&http.Request{
  Method:"POST",
  URL:(*url.URL)(0xc004628f80),
  Proto:"HTTP/1.1",
  ProtoMajor:1,
  ProtoMinor:1,
  Header:http.Header{
    "Accept":[]string{"*/*"},
    "Accept-Encoding":[]string{"gzip, deflate, br"},
    "Cache-Control":[]string{"no-cache"},
    "Connection":[]string{"keep-alive"},
    "Content-Length":[]string{"214"},
    "Content-Type":[]string{"application/json"},
    "Postman-Token":[]string{"b7569071-96b2-4845-bcb8-e7ed00435b44"},
    "User-Agent":[]string{"PostmanRuntime/7.26.1"}
  },
  Body:(*http.body)(0xc0041f5d00),
  GetBody:(func() (io.ReadCloser, error))(nil),
  ContentLength:214,
  TransferEncoding:[]string(nil),
  Close:false,
  Host:"localhost:8080",
  Form:url.Values{},
  PostForm:url.Values{},
  MultipartForm:(*multipart.Form)(nil),
  Trailer:http.Header(nil),
  RemoteAddr:"localhost:22032",
  RequestURI:"/foo/bar",
  TLS:(*tls.ConnectionState)(nil),
  Cancel:(<-chan struct {})(nil),
  Response:(*http.Response)(nil),
  ctx:(*context.valueCtx)(0xc0284bfd40)
}]
```

```go
fmt.Printf("%#v\n", day)
// time.Time{wall:0xbab699fc00000000, ext:1, loc:(*time.Location)(0x5673c0)}
```

## `%+v` output example

```
[&{Method:POST URL:/foo/bar Proto:HTTP/1.1 ProtoMajor:1 ProtoMinor:1 Header:map[Accept:[*/*] Accept-Encoding:[gzip, deflate, br] Cache-Control:[no-cache] Connection:[keep-alive] Content-Length:[214] Content-Type:[application/json] Postman-Token:[b7569071-96b2-4845-bcb8-e7ed00435b44] User-Agent:[PostmanRuntime/7.26.1]] Body:0xc0041f5d00 GetBody:<nil> ContentLength:214 TransferEncoding:[] Close:false Host:localhost:8080 Form:map[] PostForm:map[] MultipartForm:<nil> Trailer:map[] RemoteAddr:localhost:22032 RequestURI:/foo/bar TLS:<nil> Cancel:<nil> Response:<nil> ctx:0xc0284bfd40}]

format =>

[&{
  Method:POST
  URL:/foo/bar
  Proto:HTTP/1.1
  ProtoMajor:1
  ProtoMinor:1
  Header:map[
    Accept:[*/*]
    Accept-Encoding:[gzip, deflate, br]
    Cache-Control:[no-cache]
    Connection:[keep-alive]
    Content-Length:[214]
    Content-Type:[application/json]
    Postman-Token:[b7569071-96b2-4845-bcb8-e7ed00435b44]
    User-Agent:[PostmanRuntime/7.26.1]
  ]
  Body:0xc0041f5d00
  GetBody:<nil>
  ContentLength:214
  TransferEncoding:[]
  Close:false
  Host:localhost:8080
  Form:map[]
  PostForm:map[]
  MultipartForm:<nil>
  Trailer:map[]
  RemoteAddr:localhost:22032
  RequestURI:/foo/bar
  TLS:<nil>
  Cancel:<nil>
  Response:<nil>
  ctx:0xc0284bfd40
}]
```

```go
fmt.Printf("%+v\n", day)
// 2009-11-10 23:00:00 +0000 UTC m=+0.000000001
```
