---
layout: page
title: Apache Sling
---

## subsets

- OSGi
- [Apache Jackrabbit](apache-jackrabbit)
- Apache Lucene

## XPath query in JCR

```
/jcr:root/content/users/* [fn:name()="_chenyang_40masols.com"]
/jcr:root/content/users/* [position()=2]
```

Postion is not useful to limit the result of a query.

> Wrapped javax.jcr.query.InvalidQueryException: Unsupported expression with position(). Only = is supported. 

See also

- http://jackrabbit.apache.org/oak/docs/query/query.html
- sling source code http://svn.apache.org/repos/asf/sling/trunk/
- JCR Query Cheat Sheet
  - [https://wiki.magnolia-cms.com/display/WIKI/JCR+Query+Cheat+Sheet](https://wiki.magnolia-cms.com/display/WIKI/JCR+Query+Cheat+Sheet)
  - [http://aempodcast.com/2015/aem-resources/aem-queries-xpath-jcr-sql2-query-builder-syntaxes/#.WmX8w5P1V3k](http://aempodcast.com/2015/aem-resources/aem-queries-xpath-jcr-sql2-query-builder-syntaxes/#.WmX8w5P1V3k)
  - [https://github.com/paulrohrbeck/aem-links/blob/master/querybuilder_cheatsheet.md](https://github.com/paulrohrbeck/aem-links/blob/master/querybuilder_cheatsheet.md)

## ESP

EcmaScript Pages http://www.ecmascript.org/

Learning about ESP pages in Sling http://asserttrue.blogspot.jp/2010/07/learning-about-esp-pages-in-sling.html

You want to use java in your ECMA (.esp) script. https://helpx.adobe.com/experience-manager/kb/JavaFromEsp.html

{% highlight javascript %}
var adminSession = sling.getService(Packages.org.apache.sling.jcr.api.SlingRepository).loginAdministrative(null);
var query = adminSession.getWorkspace().getQueryManager().createQuery(expression, "xpath");
query.setLimit(int(limit));
{% endhighlight %}

OSGi Sling Service Example http://blogs.adobe.com/kmossman/2012/04/osgi-sling-service-example.html

## Global objects and functions in esp

- print
- load

ref
- http://sling.apache.org/apidocs/sling6/org/apache/sling/scripting/javascript/helper/SlingGlobal.html
- https://docs.adobe.com/docs/en/aem/6-0/develop/sightly/global-objects.html
- https://cwiki.apache.org/confluence/display/SLING/Scripting+variables

## Sling Architecture

https://docs.google.com/drawings/d/1vhztjfSVpK9eSAyQhLPFvpX-wD2hHlE5Pug37Ri7sEU/edit?usp=sharing

## Term

"qtp" in logs

    Thread #106/qtp2082046022-106 [priority=5, alive=true, daemon=false, interrupted=false, loader=sun.misc.Launcher$AppClassLoader@61e63e3d]

means "QuartzThreadPool"

## Common API Document

- JCR API: http://www.day.com/specs/jsr170/javadocs/jcr-2.0/index.html
- Sling API: http://sling.apache.org/apidocs/sling6/index.html
- Apache Common IO: http://commons.apache.org/proper/commons-io/apidocs/org/apache/commons/io/FileUtils.html
