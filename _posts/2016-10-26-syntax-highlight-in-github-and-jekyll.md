---
layout: post
title: "Syntax highlight in Github and Jekyll"
---

## syntax highlighter

As mentioned here [http://jekyllrb.com/docs/templates/#code-snippet-highlighting](http://jekyllrb.com/docs/templates/#code-snippet-highlighting)

By default, Rouge ( [https://github.com/jneen/rouge](https://github.com/jneen/rouge) ) is used. Supported languages is list here [https://github.com/jneen/rouge/wiki/List-of-supported-languages-and-lexers](https://github.com/jneen/rouge/wiki/List-of-supported-languages-and-lexers)

But the default syntax for syntax highlighting is as following

{% raw %}
<pre>
{% highlight ruby %}
def foo
  puts 'foo'
end
{% endhighlight %}
</pre>
{% endraw %}

## Compare syntax highlighting block

[http://stackoverflow.com/questions/15191396/octopress-jekyll-syntax-highlighting-what-are-the-advantages-of-backticks](http://stackoverflow.com/questions/15191396/octopress-jekyll-syntax-highlighting-what-are-the-advantages-of-backticks)

## Syntax highlight examples

<pre>
```${name}
```
</pre>

name list

### `sql`

```sql
SELECT * FROM db_table;
```

### `js`

```js
var foo = 'bar';
```

### `java`

```java
package fibsandlies;
import java.util.HashMap;

/**
 * This is an example of a Javadoc comment; Javadoc can compile documentation
 * from this text. Javadoc comments must immediately precede the class, method, or field being documented.
 */
public class FibCalculator extends Fibonacci implements Calculator {
    private static Map<Integer, Integer> memoized = new HashMap<Integer, Integer>();

    /*
     * The main method written as follows is used by the JVM as a starting point for the program.
     */
    public static void main(String[] args) {
        memoized.put(1, 1);
        memoized.put(2, 1);
        System.out.println(fibonacci(12)); //Get the 12th Fibonacci number and print to console
    }
```

### `yml` (not `yaml`)


```yml
swagger: '2.0'
info:
  title: NC Portal API
  description: Move your app forward with the NC API
  version: "1.0.0"
# the domain of the service
host: api.yync.org
# array of all schemes that your API supports
schemes:
  - http
  - https
```