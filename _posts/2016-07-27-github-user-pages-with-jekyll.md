---
layout: post
title:  "github user pages with jekyll"
date:   2016-07-27 23:29:33 +0800
categories: jekyll
---

## env

ubuntu 16.04

## deps

Install [Jekyll](/jekyll.html) first.

## install bundler

```
sudo gem install bundler --verbose
```

## create project

create project dir

```
mkdir test-doc-proj
cd test-doc-proj
```

create `Gemfile`

```
$ cat Gemfile
#source 'https://rubygems.org'
source 'https://ruby.taobao.org'
gem 'github-pages', group: :jekyll_plugins
```

install deps for nokogiri（忘了哪个package依赖zlib了）

```
sudo apt-get install zlib1g-dev
```

start to install

```
chenyang@PC:~/source/jekyll-sample-site$ bundle install
Fetching gem metadata from https://ruby.taobao.org/............
Fetching version metadata from https://ruby.taobao.org/..
Resolving dependencies....
Using i18n 0.7.0
Using json 1.8.3
Using minitest 5.9.0
Using thread_safe 0.3.5
Using addressable 2.4.0
Using coffee-script-source 1.10.0
Using execjs 2.7.0
Using colorator 0.1
Using ffi 1.9.14
Using multipart-post 2.0.0
Using gemoji 2.1.0
Using net-dns 0.8.0
Using public_suffix 1.5.3
Using sass 3.4.22
Using rb-fsevent 0.9.7
Using kramdown 1.11.1
Using liquid 3.0.6
Using mercenary 0.3.6
Using rouge 1.11.1
Using safe_yaml 1.0.4
Using jekyll-feed 0.5.1
Using mini_portile2 2.1.0
Using pkg-config 1.1.7
Using jekyll-paginate 1.1.0
Using jekyll-sitemap 0.10.0
Using terminal-table 1.6.0
Using bundler 1.12.5
Using tzinfo 1.2.2
Using coffee-script 2.4.1
Using ethon 0.9.0
Using rb-inotify 0.9.7
Using faraday 0.9.2
Using jekyll-sass-converter 1.3.0
Using nokogiri 1.6.8
Using activesupport 4.2.7
Using jekyll-coffeescript 1.0.1
Using typhoeus 0.8.0
Using listen 3.0.6
Using sawyer 0.7.0
Using html-pipeline 2.4.2
Using jekyll-watch 1.5.0
Using octokit 4.3.0
Using jekyll 3.1.6
Using github-pages-health-check 1.2.0
Using jekyll-gist 1.4.0
Using jekyll-github-metadata 2.0.2
Using jekyll-mentions 1.1.3
Using jekyll-redirect-from 0.11.0
Using jekyll-seo-tag 2.0.0
Using jemoji 0.7.0
Using github-pages 91
Bundle complete! 1 Gemfile dependency, 51 gems now installed.
Use `bundle show [gemname]` to see where a bundled gem is installed.
```

```
$ ls
Gemfile  Gemfile.lock
```

optional, create a new site

```
chenyang@PC:~/source/jekyll-sample-site$ bundle exec jekyll new . --force
New jekyll site installed in /home/chenyang/source/jekyll-sample-site.
```

start local server for testing

```
bundle exec jekyll serve
```

update gems after some day

```
bundle update
```
