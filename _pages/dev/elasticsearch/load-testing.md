---
layout: page
title: How to do load testing - Elasticsearch
permalink: /dev/elasticsearch/load-testing.html
---

## How to do load testing

下载 testing data

```
$ git clone https://github.com/oliver006/elasticsearch-test-data.git
```

安装依赖

```
$ sudo apt-get install python-pip python-dev
$ sudo pip install tornado numpy
```

开始运行

```
$ cd elasticsearch-test-data
$ python es_test_data.py --es_url=http://192.168.56.100:9200
```

运行结果

```
[I 160115 16:52:31 es_test_data:42] Trying to create index http://192.168.56.100:9200/test_data
[I 160115 16:52:31 es_test_data:45] Creating index "test_data" done   {"acknowledged":true}
[I 160115 16:52:31 es_test_data:183] Generating 10000 docs, upload batch size is 1000
[I 160115 16:52:32 es_test_data:62] Upload: OK - upload took:   410ms, total docs uploaded:    1000
[I 160115 16:52:32 es_test_data:62] Upload: OK - upload took:   180ms, total docs uploaded:    2000
[I 160115 16:52:32 es_test_data:62] Upload: OK - upload took:   119ms, total docs uploaded:    3000
[I 160115 16:52:33 es_test_data:62] Upload: OK - upload took:   193ms, total docs uploaded:    4000
[I 160115 16:52:34 es_test_data:62] Upload: OK - upload took:   196ms, total docs uploaded:    5000
[I 160115 16:52:34 es_test_data:62] Upload: OK - upload took:    89ms, total docs uploaded:    6000
[I 160115 16:52:35 es_test_data:62] Upload: OK - upload took:    87ms, total docs uploaded:    7000
[I 160115 16:52:36 es_test_data:62] Upload: OK - upload took:    92ms, total docs uploaded:    8000
[I 160115 16:52:36 es_test_data:62] Upload: OK - upload took:   106ms, total docs uploaded:    9000
[I 160115 16:52:37 es_test_data:62] Upload: OK - upload took:    98ms, total docs uploaded:   10000
[I 160115 16:52:37 es_test_data:214] Done - total docs uploaded: 10000, took 6 seconds
[I 160115 16:52:37 es_test_data:215] Bulk upload average:          157 ms
[I 160115 16:52:37 es_test_data:216] Bulk upload median:           112 ms
[I 160115 16:52:37 es_test_data:217] Bulk upload 95th percentile:  313 ms
```

### 方法 1： 使用 curl 进行测试

```
curl -s -XGET 192.168.56.100:9200/test_data/_search -d '{
  "query": {
    "bool": {
      "must": [],
      "must_not": [],
      "should": [
        {
          "range": {
            "test_type.age": {
              "from": "10000",
              "to": "20000"
            }
          }
        }
      ]
    }
  },
  "from": 0,
  "size": 10,
  "sort": [],
  "facets": {}
}' | grep -Eo "\"took\":[0-9]+"
```

返回`4`，说明用了 4ms 进行查询。

```
"took":4
```

进行 5 次查询。

|| 次数 || 查询时间 ||
|| 第一次 || 4ms ||
|| 第二次 || 2ms ||
|| 第三次 || 2ms ||
|| 第四次 || 3ms ||
|| 第五次 || 3ms ||

再将数据量扩充`2000,000`

```
$ python es_test_data.py --es_url=http://192.168.56.100:9200 --count=1000000
[I 160118 16:40:41 es_test_data:42] Trying to create index http://192.168.56.100:9200/test_data
[I 160118 16:40:41 es_test_data:47] Guess the index exists already
[I 160118 16:40:41 es_test_data:183] Generating 1000000 docs, upload batch size is 1000
[I 160118 16:40:41 es_test_data:62] Upload: OK - upload took:    46ms, total docs uploaded:    1000
[I 160118 16:40:41 es_test_data:62] Upload: OK - upload took:    86ms, total docs uploaded:    2000
[I 160118 16:40:41 es_test_data:62] Upload: OK - upload took:    93ms, total docs uploaded:    3000
[I 160118 16:40:41 es_test_data:62] Upload: OK - upload took:    64ms, total docs uploaded:    4000
...
[I 160118 16:45:10 es_test_data:62] Upload: OK - upload took:    42ms, total docs uploaded: 1997000
[I 160118 16:45:10 es_test_data:62] Upload: OK - upload took:    45ms, total docs uploaded: 1998000
[I 160118 16:45:10 es_test_data:62] Upload: OK - upload took:    33ms, total docs uploaded: 1999000
[I 160118 16:45:11 es_test_data:62] Upload: OK - upload took:    36ms, total docs uploaded: 2000000
[I 160118 16:45:11 es_test_data:214] Done - total docs uploaded: 1000000, took 107 seconds
[I 160118 16:45:11 es_test_data:215] Bulk upload average:           45 ms
[I 160118 16:45:11 es_test_data:216] Bulk upload median:            40 ms
[I 160118 16:45:11 es_test_data:217] Bulk upload 95th percentile:   71 ms

```

然后再使用 curl 测试一下

```
curl -s -XGET 192.168.56.100:9200/test_data/_search -d '{
  "query": {
    "bool": {
      "must": [],
      "must_not": [],
      "should": [
        {
          "range": {
            "test_type.age": {
              "from": "10000",
              "to": "20000"
            }
          }
        }
      ]
    }
  },
  "from": 0,
  "size": 10,
  "sort": [],
  "facets": {}
}' | grep -Eo "\"took\":[0-9]+"
```

|| 次数 || 查询时间 ||
|| 第一次 || 15ms ||
|| 第二次 || 11ms ||
|| 第三次 || 15ms ||
|| 第四次 || 10ms ||
|| 第五次 || 11ms ||

再增加`100,000,000`试试看。

```
$ python es_test_data.py --es_url=http://192.168.56.100:9200 --count=100000000
```

_由于数据量过大，所以中途 Ctrl+C 中断过几次。_

### 方法 2： 使用 jmeter 进行测试

下载 JMeter，http://jmeter.apache.org/

解压到

```
~/opt/apache-jmeter-2.13

```

运行

```
$ chmod +x ~/opt/apache-jmeter-2.13/bin/jmeter.sh
$ ~/opt/apache-jmeter-2.13/bin/jmeter.sh
```

配置文件

- [TestElasticsearch.jmx](/attachments/elasticsearch_testing/TestElasticsearch.jmx)
- [page.json](/attachments/elasticsearch_testing/page.json)

TODO(d3vin.chen): 未完待续。

## 第二种方法

这是官网提供的数据。

文档参照 https://www.elastic.co/guide/en/kibana/3.0/import-some-data.html

先做这个

```
curl -XPUT http://192.168.56.100:9200/shakespeare -d '
{
 "mappings" : {
  "_default_" : {
   "properties" : {
    "speaker" : {"type": "string", "index" : "not_analyzed" },
    "play_name" : {"type": "string", "index" : "not_analyzed" },
    "line_id" : { "type" : "integer" },
    "speech_number" : { "type" : "integer" }
   }
  }
 }
}
';
```

返回

```
{"acknowledged":true}
```

下载数据

```
wget https://www.elastic.co/guide/en/kibana/3.0/snippets/shakespeare.json -O /tmp/shakespeare.json
```

导入数据

curl -XPUT 192.168.56.100:9200/\_bulk --data-binary @/tmp/shakespeare.json

然后测试一下查询速度

```
curl -s -XGET 192.168.56.100:9200/shakespeare/_search -d '{
  "query": {
    "bool": {
      "should": [
        {
          "query_string": {
            "default_field": "line.text_entry",
            "query": "benches after noon"
          }
        }
      ]
    }
  },
  "from": 0,
  "size": 250
}' | grep -Po "took\":\K[0-9]+"
```

得到

```
10
```

说明是查询时间为 10ms

```

```
