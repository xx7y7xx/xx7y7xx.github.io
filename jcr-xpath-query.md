---
layout: page
title: XPath Query
---

## XPath JCR Sample Queries

- Compare date propertie, using `xs:dateTime()` function.
    /jcr:root/content/* [@jcr:created > xs:dateTime('2015-06-01T00:00:00.000Z')] order by @jcr:created descending