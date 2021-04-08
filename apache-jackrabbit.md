---
layout: page
title: Apache Jackrabbit
---

## persistence manager ( postgresql )

Login to db

```
sudo -u postgres psql
```

Change to `d3vin` database.

```
postgres=# \c d3vin
You are now connected to database "d3vin" as user "postgres".
```

Show tables scheme in this databse.

```
               List of relations
 Schema |          Name           | Type  |    Owner    
--------+-------------------------+-------+-------------
 public | jcr_default_binval      | table | d3vin
 public | jcr_default_bundle      | table | d3vin
 public | jcr_default_names       | table | d3vin
 public | jcr_default_refs        | table | d3vin
 public | jcr_security_binval     | table | d3vin
 public | jcr_security_bundle     | table | d3vin
 public | jcr_security_names      | table | d3vin
 public | jcr_security_refs       | table | d3vin
 public | journal_global_revision | table | d3vin
 public | journal_journal         | table | d3vin
 public | journal_local_revisions | table | d3vin
 public | version_binval          | table | d3vin
 public | version_bundle          | table | d3vin
 public | version_names           | table | d3vin
 public | version_refs            | table | d3vin
```

Persistence data stored in `jcr_default_bundle` table

```
d3vin=# select * from jcr_default_bundle where node_id_hi = -2899165433918176557 and node_id_lo = -4722728287760232109;
      node_id_hi      |      node_id_lo      |                                                                                                         
                                        bundle_data                                                                                                    

----------------------+----------------------+---------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------
 -2899165433918176557 | -4722728287760232109 | \x039525687474703a2f2f736c696e672e6170616368652e6f72672f6a63722f736c696e672f312e30466f6c646572fd86ee263b
a74050a09b2a9fbe2f208201508a787864656275673131313101000b78786465627567323232320701000561646d696e0b0100186170706c69636174696f6e2f6f637465742d73747265616
d060500c2f6feaed081bc05080500c2f6feaed081bc05
(1 row)
```

Hex to ASCII

```
03 95 25

 h  t  t  p  :  /  /  s  l  i  n  g  .  a  p  a  c  h  e  .  o  r  g  
68 74 74 70 3a 2f 2f 73 6c 69 6e 67 2e 61 70 61 63 68 65 2e 6f 72 67

 /  j  c  r  /  s  l  i  n  g  /  1  .  0
2f 6a 63 72 2f 73 6c 69 6e 67 2f 31 2e 30

 F  o  l  d  e  r
46 6f 6c 64 65 72

fd86ee26-3ba7-4050-a09b-2a9fbe2f2082 ( parent node uuid )
fd 86 ee 26 3b a7 40 50 a0 9b 2a 9f be 2f 20 82


          x  x  d  e  b  u  g  1  1  1  1  (property key)
01 50 8a 78 78 64 65 62 75 67 31 31 31 31

          x  x  d  e  b  u  g  2  2  2  2  (property value)
01 00 0b 78 78 64 65 62 75 67 32 32 32 32

07 01 00 05

 a  d  m  i  n
61 64 6d 69 6e

0b 01 00 18

 a  p  p  l  i  c  a  t  i  o  n  /  o  c  t  e  t  -  s  t  r  e  a  m
61 70 70 6c 69 63 61 74 69 6f 6e 2f 6f 63 74 65 74 2d 73 74 72 65 61 6d

060500c2f6feaed081bc05080500c2f6feaed081bc05
```

If node has child, Hex to ASCII

```
039525687474703a2f2f736c696e672e6170616368652e6f72672f6a63722f736c696e672f312e30466f6c646572

fd86ee263ba74050a09b2a9fbe2f2082 // parent node uuid

014407010005
61646d696e // admin

0b010018
6170706c69636174696f6e2f6f637465742d73747265616d //  a  p  p  l  i  c  a  t  i  o  n  /  o  c  t  e  t  -  s  t  r  e  a  m

060500c2
b6a8f4f481b405080500c2bea8f4f481b40581

6d33 // m3 node name

b358c9b2b56140a19f3eff04cad1dcec // m3 node uuid
```

If something is wrong when rebuilding index, error message like this

```
27.08.2015 01:21:08.516 *INFO* [FelixStartLevel] org.apache.jackrabbit.core.query.lucene.MultiIndex indexing... /content/moxingzhizuo/tasks/model201504081120054439152 (99200)
27.08.2015 01:21:08.534 *ERROR* [FelixStartLevel] org.apache.jackrabbit.core.query.OnWorkspaceInconsistency Node /content/moxingzhizuo/tasks (17101256-46f3-446e-8ea8-5a1a96842465) has missing child 'model201508130441452731757' (9e82b6ff-2b25-456a-b867-c42e2e193e0a)
27.08.2015 01:21:08.540 *ERROR* [FelixStartLevel] org.apache.jackrabbit.core.RepositoryImpl Failed to initialize workspace 'default'
javax.jcr.RepositoryException: Unable to initialize query handler: org.apache.jackrabbit.core.query.lucene.SearchIndex@6d44cf50
        at org.apache.jackrabbit.core.config.RepositoryConfigurationParser$1.getQueryHandler(RepositoryConfigurationParser.java:686)
        at org.apache.jackrabbit.core.config.WorkspaceConfig.getQueryHandler(WorkspaceConfig.java:251)
        at org.apache.jackrabbit.core.SearchManager.<init>(SearchManager.java:171)
        at org.apache.jackrabbit.core.RepositoryImpl$WorkspaceInfo.getSearchManager(RepositoryImpl.java:1862)
        at org.apache.jackrabbit.core.RepositoryImpl$WorkspaceInfo.doPostInitialize(RepositoryImpl.java:2098)
        at org.apache.jackrabbit.core.RepositoryImpl$WorkspaceInfo.initialize(RepositoryImpl.java:2004)
        at org.apache.jackrabbit.core.RepositoryImpl.initStartupWorkspaces(RepositoryImpl.java:517)
        at org.apache.jackrabbit.core.RepositoryImpl.<init>(RepositoryImpl.java:324)
        at org.apache.jackrabbit.core.RepositoryImpl.create(RepositoryImpl.java:589)
        at org.apache.sling.jcr.jackrabbit.server.impl.SlingServerRepositoryManager.acquireRepository(SlingServerRepositoryManager.java:208)
        at org.apache.sling.jcr.base.AbstractSlingRepositoryManager.start(AbstractSlingRepositoryManager.java:304)
        at org.apache.sling.jcr.jackrabbit.server.impl.SlingServerRepositoryManager.activate(SlingServerRepositoryManager.java:345)
```

Try to insert a fake node for the missing one (`model201508130441452731757`). You should make sure the uuid of node's parent is correct.

```
d3vin=# insert into jcr_default_bundle (node_id_hi, node_id_lo, bundle_data) values (-7024851261687773846, -5158939145508667894, '\x039525687474703a2f2f736c696e672e6170616368652e6f72672f6a63722f736c696e672f312e30466f6c6465721710125646f3446e8ea85a1a968424650070028963726561746574696d65010014323031342d30372d32385430323a31363a31305a846d7479706501000a6861737069637475726586726566706174680100302f636f6e74656e742f6d6f78696e677a68697a756f2f6d6f64656c32303134303732383130313631303137383630313084737461746501000231340701000561646d696e846d616b65720100135f68616e6865315f343073706f6c6f2e6f726784726566696401002462643262363739312d383632662d346231312d383166302d316431383739316638353363060500c2bede8792c1b80485617574686f720100195f646568656a6961646962616e5f343073706f6c6f2e6f7267');
INSERT 0 1
```

A snippet code copied from Apache JacketRabbit, convert uuid to hex ( node_id_hi/node_id_lo, msb/lsb )

[https://gist.github.com/xxd3vin/ed525567e20dd5e6fc5f44e40143caaf](https://gist.github.com/xxd3vin/ed525567e20dd5e6fc5f44e40143caaf)

```
$ java UUID2Hex
Enter a UUID: 9e82b6ff2b25456ab867c42e2e193e0a        
9e82b6ff2b25456ab867c42e2e193e0a
msb: -7024851261687773846
lsb: -5158939145508667894
9e82b6ff-2b25-456a-b867-c42e2e193e0a
```

Data is missing

```
d3vin=# select * from jcr_default_bundle where node_id_hi = -7024851261687773846 and node_id_lo = -5158939145508667894;
 node_id_hi | node_id_lo | bundle_data 
------------+------------+-------------
(0 rows)
```

## Monitor connections from all clusters to postgresql

```
postgres=# select * from pg_stat_activity;
 datid | datname  |  pid  | usesysid | usename | application_name | client_addr  | client_hostname | client_port |         backend_start         | 
         xact_start           |          query_start          |         state_change          | waiting |        state        |                        
                                    query                                                            
-------+----------+-------+----------+-------------+------------------+--------------+-----------------+-------------+-------------------------------+-
------------------------------+-------------------------------+-------------------------------+---------+---------------------+------------------------
-----------------------------------------------------------------------------------------------------
 16385 | d3vin    | 61302 |    16384 | d3vin   |                  | 192.168.0.12 |                 |       26491 | 2015-12-03 12:47:31.994822+08 | 
                              | 2015-12-03 13:30:31.347535+08 | 2015-12-03 13:30:31.347758+08 | f       | idle                | select BUNDLE_DATA from
 JCR_DEFAULT_BUNDLE where NODE_ID_HI = $1 and NODE_ID_LO = $2
 16385 | d3vin    |  3185 |    16384 | d3vin   |                  | 192.168.0.12 |                 |       29426 | 2015-12-03 13:30:17.627037+08 | 
                              | 2015-12-03 13:30:31.422517+08 | 2015-12-03 13:30:31.42257+08  | f       | idle                | select BUNDLE_DATA from
 JCR_DEFAULT_BUNDLE where NODE_ID_HI = $1 and NODE_ID_LO = $2
 16385 | d3vin    | 60035 |    16384 | d3vin   |                  | 192.168.0.12 |                 |       25876 | 2015-12-03 12:38:16.537205+08 | 
2015-12-03 13:05:38.791865+08 | 2015-12-03 13:05:38.792238+08 | 2015-12-03 13:05:38.792239+08 | t       | active              | update JOURNAL_GLOBAL_R
EVISION set REVISION_ID = REVISION_ID + 1

....

(22 rows)
```

## Rebuild index

比如这样的日志

```
org.apache.jackrabbit.core.query.lucene.MultiIndex indexing... /jcr:system/jcr:nodeTypes/nt:childNodeDefinition/jcr:propertyDefinition[6] (100)
....
org.apache.jackrabbit.core.query.lucene.MultiIndex indexing... /foo/bar (216900)
```

说明正在重建`/foo/bar`这个节点的索引。

每重建100条索引，会打印一行日志。对应的`(216900)`，说明当前正在重建的索引是第216900条。

对应的代码

```
jackrabbit-core/src/main/java/org/apache/jackrabbit/core/query/lucene/MultiIndex.java
```

### 将索引写入文件系统

```
org.apache.jackrabbit.core.query.lucene.IndexMerger merged 200 documents in 181 ms into _4yo.
```

其中`_4yo`对应了索引所在的目录，比如

```
/JACKRABBIT/workspaces/default/index/_4yo/
|-- _0.cfs
|-- cache.inSegmentParents
|-- segments_2
`-- segments.gen
```

对应的代码

```
jackrabbit-core/src/main/java/org/apache/jackrabbit/core/query/lucene/IndexMerger.java
```

## See also

- [Apache Sling](apache-sling)
