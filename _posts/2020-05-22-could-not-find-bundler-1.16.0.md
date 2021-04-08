---
layout: post
title: "Could not find 'bundler' (1.16.0)"
---

```
Traceback (most recent call last):
	2: from /Users/chenyang/.rvm/gems/ruby-2.7.1/bin/bundle:23:in `<main>'
	1: from /Users/chenyang/.rvm/rubies/ruby-2.7.1/lib/ruby/2.7.0/rubygems.rb:294:in `activate_bin_path'
/Users/chenyang/.rvm/rubies/ruby-2.7.1/lib/ruby/2.7.0/rubygems.rb:275:in `find_spec_for_exe': Could not find 'bundler' (1.16.0) required by your /Users/chenyang/source/xxd3vin.github.io/Gemfile.lock. (Gem::GemNotFoundException)
To update to the latest version installed on your system, run `bundle update --bundler`.
To install the missing version, run `gem install bundler:1.16.0`
```

## Solution

```
$ bundle update --bundler
```

## References

- [https://stackoverflow.com/questions/57758654/why-do-i-get-could-not-find-bundler-1-17-3-after-upgrading-ruby](https://stackoverflow.com/questions/57758654/why-do-i-get-could-not-find-bundler-1-17-3-after-upgrading-ruby)
