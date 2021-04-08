---
layout: page
title: yyssc-chat项目
---

## 难点

### 聊天数据的存储

- RDBMS还是NoSQL

http://highscalability.com/blog/2014/1/6/how-hipchat-stores-and-indexes-billions-of-messages-using-el.html

### Java后端渲染还是Node后端渲染

### 聊天记录支持多媒体内容

比如发送文件（图片）

## UI原型

- 2016-08-29 http://10.10.71.101:8880/online-comm
- 2016-09-01 http://10.10.71.101:8880/online-comm2

## 测试数据

2016-09-01 10:22

```
单据为：
billid=000_709FDD96-FCB5-44DC-B33C-7086371EE12F
tradetype=FCT1-01
youyou与u1（李四） 的聊天：
youyou 的ID：8a81cccc5668035e0156680b2ea50003
u1的ID：1001ZZ10000000000VNF 


http://10.10.71.101:8888/sscpub/sckmsg/usermsghistory?userid=1001ZZ10000000000VNF 
http://10.10.71.101:8888/sscpub/sckmsg/usermsghistory?userid=1001ZZ10000000000VNF&billid=000_709FDD96-FCB5-44DC-B33C-7086371EE12F&tradetype=FCT1-01 
http://10.10.71.101:8888/sscpub/sckmsg/billmsghistory?billid=000_709FDD96-FCB5-44DC-B33C-7086371EE12F&tradetype=FCT1-01
```

## UML

plantuml-start

Browser -> FileController: upload(imageFile)
FileController --> Browser: {imageID}
Browser -> Socket: sendMessage(imageID)

Socket -> Browser: {imageID}
Browser --> FileController: getImageURL(imageID)
FileController -> Browser: {imageURL}

plantuml-end

## See also

- [后端联调](/2016/08/30/backend)
