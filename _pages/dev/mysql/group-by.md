---
layout: page
title: group by
permalink: /dev/mysql/group-by.html
---

I have

| name | register_date       |
| :--- | :------------------ |
| Foo  | 2013-10-10 16:54:10 |
| Foo2 | 2013-10-11 16:54:10 |
| Bar  | 2013-09-10 16:54:10 |

I want

| month      | count |
| :--------- | :---- |
| 2013-10-01 | 2     |
| 2013-11-01 | 1     |

SQL

```
SELECT COUNT(*), DATE_FORMAT(register_date, "%Y-%m-01")
FROM register_users
GROUP BY DATE_FORMAT(register_date, "%Y-%m-01")
```

## References

- [https://stackoverflow.com/a/20963546](https://stackoverflow.com/a/20963546)
