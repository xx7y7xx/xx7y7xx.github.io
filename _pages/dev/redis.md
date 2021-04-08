---
layout: page
title: Redis
---

## Redis Usage

### CLI command

```
127.0.0.1:6379> keys *
1) "chat:messages"
2) "people"
3) "test"
```

### "list" type

```
127.0.0.1:6379> type chat:messages
list
```

```
127.0.0.1:6379> lrange chat:messages 0 0
1) "{\"m\":\"aaa\",\"t\":1503481128994,\"n\":\"chenyangf\"}"
127.0.0.1:6379> lrange chat:messages 0 1
1) "{\"m\":\"aaa\",\"t\":1503481128994,\"n\":\"chenyangf\"}"
2) "{\"m\":\"ttt\",\"t\":1503481150154,\"n\":\"chenyangf\"}"
127.0.0.1:6379> lrange chat:messages 0 2
1) "{\"m\":\"aaa\",\"t\":1503481128994,\"n\":\"chenyangf\"}"
2) "{\"m\":\"ttt\",\"t\":1503481150154,\"n\":\"chenyangf\"}"
3) "{\"m\":\"aaaaaaaaaaa\",\"t\":1503481161851,\"n\":\"chenyangf\"}"
```

### "string" type

```
127.0.0.1:6379> type test
string
127.0.0.1:6379> get test
"It's working2"
```

### "list" type

```
127.0.0.1:6379> type test_list
list
127.0.0.1:6379> LRANGE test_list 0 10
1) "26"
```

### "hash" type

```
127.0.0.1:6379> TYPE test_hash
hash
127.0.0.1:6379> HGETALL test_hash
1) "apple"
2) "100"
3) "orange"
4) "200"
```

### Remove keys

```
127.0.0.1:6379> del test
```

### Sorted Set

```
localhost:6379> type foo
zset
```

Get all members in Sorted Set

```
localhost:6379> zrange foo 0 -1
1) "963e73d7-21f5-4dd8-b407-d334ef94007d"
2) "07162fea-1a7a-4744-8fd5-37f986c88c1c"
```

## See also

- [Redis](/dev/redis-installation.html)

## References

- [https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-redis-on-ubuntu-16-04](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-redis-on-ubuntu-16-04)
- [https://www.digitalocean.com/community/tutorials/how-to-configure-a-redis-cluster-on-centos-7](https://www.digitalocean.com/community/tutorials/how-to-configure-a-redis-cluster-on-centos-7)
