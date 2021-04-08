---
layout: page
title: Github Pages markdown code block examples
---

## Fix width font (1)

Code:

<pre>
This is ```fix-width``` font.
</pre>

View:

This is ```fix-width``` font.

## Fix width font (2)

Code:

<pre>
This is `fix-width` font.
</pre>

View:

This is `fix-width` font.

## Code block with indent

code:

<pre>
    var foo = "bar";
    document.write(foo);
    function xxdebug()
    {
      return false;
    }
</pre>

view:

    var foo = "bar";
    document.write(foo);
    function xxdebug()
    {
      return false;
    }

## Code block with <code>```</code>

code:

<pre>
```
var foo = "bar";
document.write(foo);
function xxdebug()
{
  return false;
}
```
</pre>

view:

```
var foo = "bar";
document.write(foo);
function xxdebug()
{
  return false;
}
```

## syntax highlight

code:

<pre>
{% highlight javascript %}
var foo = "bar";
document.write(foo);
function xxdebug()
{
  return false;
}
{% endhighlight %}
</pre>

view:

{% highlight javascript %}
var foo = "bar";
document.write(foo);
function xxdebug()
{
  return false;
}
{% endhighlight %}

## Code block (fenced code blocks)

code:

<pre>
```
# ls
foo bar
```
</pre>

view:

```
# ls
foo bar
```

## Code block with syntax highlight (fenced code blocks)

code:

<pre>
```javascript
var foo = "bar";
```
</pre>

view:

```javascript
var foo = "bar";
```