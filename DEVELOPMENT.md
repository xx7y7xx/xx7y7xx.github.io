# Development

## Theme

This project use the Jekyll default theme whose repo is [github.com/jekyll/minima](https://github.com/jekyll/minima).

## Templating

Jekyll uses the Liquid templating language to process templates.

All the template files are placed in the `_includes/` dir. For example, `_includes/head.html` is the header part of every pages.

[Liquid -> filters -> prepend](https://shopify.github.io/liquid/filters/prepend/)

```
https://yyssc.github.io/gnuplog/css/main.css
-----------------------========-------------
            |             |         `---------- (page) path
            |             `-------------------- site.baseurl
            `---------------------------------- site.url
```

## CI/CD

This project uses Travis CI.
The config file is [`.travis.yml`](https://github.com/xxd3vin/xxd3vin.github.io/blob/develop/.travis.yml)

### Build

Run [`jgd`](https://github.com/yegor256/jekyll-github-deploy) to build the Markdown files in the `develop` branch to the HTML files, and then `git push` all the generated HTML files to the remote `master` branch.

### Post Build

Run [`_travis/test_pages_existence.sh`](https://github.com/xxd3vin/xxd3vin.github.io/blob/develop/_travis/test_pages_existence.sh) to check the MUST HAVE files like "index.html" or "sitemap.xml".

## How to write a blog post

A blog post is a article which places in the `_posts` dir.

Simple title

```
---
layout: post
title: Foo Bar
---
```

Complex title

```
---
layout: post
title: "/usr/local/bin/bundle:23:in `load': cannot load such file -- /usr/local/lib/ruby/gems/2.6.0/gems/bundler-1.17.3/exe/bundle (LoadError)"
---
```

Use a online [slug generator](https://blog.tersmitten.nl/slugify/) to create a better filename for the post.
For example, change `ImportError: cannot import name 'HtmlXPathSelector' from 'scrapy.selector'` into `importerror-cannot-import-name-htmlxpathselector-from-scrapyselector`.

### Post Excerpts

```
---
layout: post
title: This is the blog post title
---

This is the blog post description.
```

The content between `---` is Jekyll [Front Matter](https://jekyllrb.com/docs/frontmatter/)

By default, the first block of text after front matter is [Post Excerpts](https://jekyllrb.com/docs/posts/#post-excerpts).
This section will create the meta description in HTML.

The generated HTML is like below:

```
<head>
  <title>This is the blog post title</title>
  <meta name="description" content="This is the blog post description.">
</head>
```

## Markdown syntax

### Markdown converter

This project uses [kramdown](/kramdown) as the markdown converter.
So all the posts and pages should follow the kramdown syntax, or other Markdown syntaxes which are supported by kramdown converter, e.g. [Github Flavored Markdown](https://kramdown.gettalong.org/parser/gfm.html)

### Syntax tutorial

[https://kramdown.gettalong.org/quickref.html](https://kramdown.gettalong.org/quickref.html)

### Syntax highlighting examples

- [Github Pages markdown code block examples](http://xxd3vin.github.io/development/github-pages/github-pages-markdown-code-block-examples.html)

## Develop and preview

Using Atom, ctrl-shift-m can preview markdown.

Or run a local server which could listen your changes and update on the fly.

```
$ bundle exec jekyll serve --trace
```

## Sitemap

This project use [`jekyll-sitemap`](https://github.com/jekyll/jekyll-sitemap) to generate `sitemap.xml`. You can find this dependency in the `Gemfile` file.

## Other websites which use Jekyll

- [https://codinfox.github.io](https://codinfox.github.io)

## Tools

- [http://tmpvar.com/markdown.html](http://tmpvar.com/markdown.html) - A online Markdown editor with live preview which uses [GitHub Flavored Markdown](https://help.github.com/articles/github-flavored-markdown/) syntax.
