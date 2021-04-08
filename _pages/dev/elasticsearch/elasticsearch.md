---
layout: page
title: Elasticsearch Query
permalink: /dev/elasticsearch/query.html
---

## Match query

[https://www.elastic.co/guide/en/elasticsearch/reference/6.2/query-dsl-match-query.html](https://www.elastic.co/guide/en/elasticsearch/reference/6.2/query-dsl-match-query.html)

Functions:

- Simple match query.
- Matches if one term is a match.
- More the terms matched, the better the score.
- Analyzer applied by default.

Sample query: "foo bar"

Matching text:

- "foo bar 2000"
- "foo 2000"
- "bar 2000"

Not matching text:

- "2000"
- "f"

## Term query

[https://www.elastic.co/guide/en/elasticsearch/reference/6.2/query-dsl-term-query.html](https://www.elastic.co/guide/en/elasticsearch/reference/6.2/query-dsl-term-query.html)

Functions:

- Queries on the tokens generated.
- Analyzer is not applied.

Sample query: "foo bar"

Matching text:

- "foo bar 2000"

Not matching text:

- "bar foo"
- "foo 2000 bar"
