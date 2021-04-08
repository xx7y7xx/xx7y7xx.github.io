---
layout: page
title: kramdown syntax
---

## Additional link attributes

Additional link attributes (like "target") can be added, for more details please see [Inline Links](https://kramdown.gettalong.org/syntax.html#inline-links)

```
[Foo](https://foo.com){:target="_blank"}
```

## Code block

```
var foo = 'bar';
```

## Table # {#table}

| Priority apples | Second priority | Third priority |
| --------------- | --------------- | -------------- |
| ambrosia        | gala            | red delicious  |
| pink lady       | jazz            | macintosh      |
| honeycrisp      | granny smith    | fuji           |

<pre>
| Priority apples | Second priority | Third priority |
| --------------- | --------------- | -------------- |
| ambrosia        | gala            | red delicious  |
| pink lady       | jazz            | macintosh      |
| honeycrisp      | granny smith    | fuji           |
</pre>

## Specifying a Header ID # {#specifying-a-header-id}

### kramdown

[https://kramdown.gettalong.org/syntax.html#specifying-a-header-id](https://kramdown.gettalong.org/syntax.html#specifying-a-header-id)

Code:

<pre>
##### Hello1 {#id1}

##### Hello2 # {#id2}

##### Header with auto id
</pre>

::View-Start::

##### Hello1 {#id1}

##### Hello2 # {#id2}

##### Header with auto id

::View-End::

### markdown

[http://stackoverflow.com/a/7335839/4685522](http://stackoverflow.com/a/7335839/4685522)

Code:

<pre>
## heading<a name="headin"></a>
</pre>

View:

## heading<a name="headin"></a>

## References

- [kramdown Syntax Document](http://kramdown.gettalong.org/syntax.html)
- [https://github.com/gettalong/kramdown](https://github.com/gettalong/kramdown)
