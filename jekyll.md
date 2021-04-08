---
layout: page
title: Jekyll
---

## installation

### ubuntu 16.04

Install Ruby on Ubuntu (16.04), see [Ruby gem](/gem)

```
sudo gem install jekyll --verbose
```

### macOS 10.13

macOS shiped with ruby and gem

```
$ ruby -v
ruby 2.2.6p396 (2016-11-15 revision 56800) [x86_64-darwin16]
$ gem -v
2.6.12
```

install jekyll and bundler

```
$ gem install jekyll bundler
```

## Prepare project document dir

```
$ mkdir doc
$ cd doc
$ cat _config.yml
source: "/tmp/doc"
destination: "/tmp/site"
$ cat _layouts/default.html
<title>{{ page.title }}</title>
<div>{{ content }}</div>
```

## create first document

```
$ cd doc
$ cat index.md
---
layout: page
title: index
---

- 1
- 2
```

## Build document

```
$ cd doc
$ jekyll build
```

## Result

```
$ cd /tmp/site
$ cat index.html
<title>index</title>
<div><ul>
  <li>1</li>
  <li>2</li>
</ul></div>
```

## 如果代码中有liquid语法

可以使用`{% raw  %}`和`{% endraw  %}`将这一部分注释掉。

## 如果无法加载`_plugins`下的插件，先检查site.safe是否是disable

{% raw  %}
```
$ bundle exec jekyll serve --trace 
Configuration file: /home/chenyang/source/xxd3vin.github.io/_config.yml
            Source: /home/chenyang/source/xxd3vin.github.io
       Destination: /home/chenyang/source/xxd3vin.github.io/_site
 Incremental build: disabled. Enable with --incremental
      Generating... 
    Liquid Warning: Liquid syntax error (line 5): Unexpected character # in "{{#jiandanurl: tesejiaoyuzhanlanguan }}" in mediawiki.md
  Liquid Exception: Liquid syntax error (line 17): Unknown tag 'plantuml' in plantuml.md
/var/lib/gems/2.1.0/gems/liquid-3.0.6/lib/liquid/block.rb:87:in `unknown_tag': Liquid syntax error (line 17): Unknown tag 'plantuml' (Liquid::SyntaxError)
	from /var/lib/gems/2.1.0/gems/liquid-3.0.6/lib/liquid/block.rb:38:in `parse'
	from /var/lib/gems/2.1.0/gems/liquid-3.0.6/lib/liquid/tag.rb:10:in `parse'
	from /var/lib/gems/2.1.0/gems/liquid-3.0.6/lib/liquid/document.rb:5:in `parse'
	from /var/lib/gems/2.1.0/gems/liquid-3.0.6/lib/liquid/template.rb:122:in `parse'
	from /var/lib/gems/2.1.0/gems/liquid-3.0.6/lib/liquid/template.rb:108:in `parse'
	from /var/lib/gems/2.1.0/gems/jekyll-3.2.1/lib/jekyll/liquid_renderer/file.rb:11:in `block in parse'
	from /var/lib/gems/2.1.0/gems/jekyll-3.2.1/lib/jekyll/liquid_renderer/file.rb:47:in `measure_time'
	from /var/lib/gems/2.1.0/gems/jekyll-3.2.1/lib/jekyll/liquid_renderer/file.rb:10:in `parse'
	from /var/lib/gems/2.1.0/gems/jekyll-3.2.1/lib/jekyll/renderer.rb:109:in `render_liquid'
	from /var/lib/gems/2.1.0/gems/jekyll-3.2.1/lib/jekyll/renderer.rb:62:in `run'
	from /var/lib/gems/2.1.0/gems/jekyll-3.2.1/lib/jekyll/site.rb:458:in `block in render_pages'
	from /var/lib/gems/2.1.0/gems/jekyll-3.2.1/lib/jekyll/site.rb:456:in `each'
	from /var/lib/gems/2.1.0/gems/jekyll-3.2.1/lib/jekyll/site.rb:456:in `render_pages'
	from /var/lib/gems/2.1.0/gems/jekyll-3.2.1/lib/jekyll/site.rb:191:in `render'
	from /var/lib/gems/2.1.0/gems/jekyll-3.2.1/lib/jekyll/site.rb:69:in `process'
	from /var/lib/gems/2.1.0/gems/jekyll-3.2.1/lib/jekyll/command.rb:26:in `process_site'
	from /var/lib/gems/2.1.0/gems/jekyll-3.2.1/lib/jekyll/commands/build.rb:63:in `build'
	from /var/lib/gems/2.1.0/gems/jekyll-3.2.1/lib/jekyll/commands/build.rb:34:in `process'
	from /var/lib/gems/2.1.0/gems/jekyll-3.2.1/lib/jekyll/commands/serve.rb:36:in `block (2 levels) in init_with_program'
	from /var/lib/gems/2.1.0/gems/mercenary-0.3.6/lib/mercenary/command.rb:220:in `call'
	from /var/lib/gems/2.1.0/gems/mercenary-0.3.6/lib/mercenary/command.rb:220:in `block in execute'
	from /var/lib/gems/2.1.0/gems/mercenary-0.3.6/lib/mercenary/command.rb:220:in `each'
	from /var/lib/gems/2.1.0/gems/mercenary-0.3.6/lib/mercenary/command.rb:220:in `execute'
	from /var/lib/gems/2.1.0/gems/mercenary-0.3.6/lib/mercenary/program.rb:42:in `go'
	from /var/lib/gems/2.1.0/gems/mercenary-0.3.6/lib/mercenary.rb:19:in `program'
	from /var/lib/gems/2.1.0/gems/jekyll-3.2.1/exe/jekyll:13:in `<top (required)>'
	from /usr/local/bin/jekyll:23:in `load'
	from /usr/local/bin/jekyll:23:in `<main>'
```
{% endraw %}

也有可能是因为在`Gemfile`中添加了`#gem 'github-pages'`，这会将`site.safe`设置为`true`，导致无法加载`_plugins`下的`*.rb`了。

## Jekyll templates

Use [Liquid](https://shopify.github.io/liquid/) as templates engine by default.

Syntax like

{% raw %}
<textarea>
<ul id="products">
  {% for product in products %}
    <li>
      <h2>{{ product.name }}</h2>
      Only {{ product.price | price }}

      {{ product.description | prettyprint | paragraph }}
    </li>
  {% endfor %}
</ul>
</textarea>
{% endraw %}

## Jekyll markdown processor

Use [kramdown](https://github.com/gettalong/kramdown) by default.

## Fix building error

Found error `mapping values are not allowed in this context at line 3 column 17`

```
+jekyll build
Configuration file: /tmp/jgd-Luj/clone/_config.yml
            Source: /tmp/jgd-Luj/clone
       Destination: /tmp/jgd-Luj/clone/_site
 Incremental build: disabled. Enable with --incremental
      Generating... 
             Error: could not read file /tmp/jgd-Luj/clone/_posts/2018-04-03-typeerror-cannot-read-property-location-of-null.md: (<unknown>): mapping values are not allowed in this context at line 3 column 17
File /tmp/jgd-Luj/clone/uml/f9c0a3f22b87ac41771ecda270f82089.svg created (1667 bytes)
File /tmp/jgd-Luj/clone/uml/bd34b857a013c553afe9611a19e06bce.svg created (5021 bytes)
                    done in 9.812 seconds.
```

Change

```
title: TypeError: Cannot read property '_location' of null
```

to

```
title: "TypeError: Cannot read property '_location' of null"
```

## Put all pages in "_pages" folder

See [https://github.com/jekyll/jekyll/issues/920#issuecomment-63093764](https://github.com/jekyll/jekyll/issues/920#issuecomment-63093764){:target="_blank"}

1. Modify `_config.yml`

```
include: ['_pages']
```

2. Create `_pages` folder, create a file under it with the front matter:

```
---
permalink: /ava.html
title: ava
layout: page
---
```

## See also

- [Ruby](/ruby.html)
- [Ruby gem](/gem)
- [kramdown](/kramdown)
- [Syntax highlight in Github and Jekyll](/2016/10/26/syntax-highlight-in-github-and-jekyll.html)

## References

- [https://ruby.taobao.org/](https://ruby.taobao.org/)
- [http://jekyllrb.com/](http://jekyllrb.com/)