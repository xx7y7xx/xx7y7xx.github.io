---
layout: page
title: Ruby gem
---

## Install bundler gem

```
gem install bundler
```

## 修改 gem 源

`~/.gemrc`

```
gem sources -l
gem sources --remove https://rubygems.org/
gem sources --remove http://rubygems.org/
gem sources --add https://ruby.taobao.org/
```

或者

```
gem sources --add https://gems.ruby-china.org/ --remove https://rubygems.org/
```

## 修改 bundler 源

`~/.bundle/config

```
bundle config mirror.https://rubygems.org https://gems.ruby-china.org
```

## See also

- [Ruby](/ruby.html)

## References

- [https://ruby.taobao.org/](https://ruby.taobao.org/)
