---
layout: page
title: Search JSON values with MySQL JSON_EXTRACT()
permalink: /dev/mysql/json.html
---

I have a "object" table

| id  | obj            |
| :-- | :------------- |
| 1   | {"name":"foo"} |
| 2   | {"name":"bar"} |

I want these columns

| id  | name |
| :-- | :--- |
| 1   | foo  |

SQL

```
SELECT
  id,
  JSON_EXTRACT(obj, '$.name') as name,
FROM object
WHERE
  JSON_CONTAINS_PATH(obj, 'one', '$.name') = 'foo'
;
```

## References

- [https://dev.mysql.com/doc/refman/8.0/en/json-search-functions.html](https://dev.mysql.com/doc/refman/8.0/en/json-search-functions.html)
