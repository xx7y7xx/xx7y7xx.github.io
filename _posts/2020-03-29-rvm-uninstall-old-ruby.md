---
layout: post
title: "RVM uninstall old Ruby"
---

#### Uninstall

I'm using macOS Catalina 10.15 now which comes with ruby 2.6.3.
But when I'm running `ruby`, it uses a old version 2.2.

```
$ ruby -v
ruby 2.2.6p396 (2016-11-15 revision 56800) [x86_64-darwin16]
```

After checking with `rvm list`, I found `2.2.6` was installed.

```
$ rvm list

rvm rubies

=* ruby-2.2.6 [ x86_64 ]

# => - current
# =* - current && default
#  * - default
```

So I try to uninstall it with this command. And go to use the default Ruby in macOS.

```
$ rvm remove 2.2.6
ruby-2.2.6 - #removing src/ruby-2.2.6 - please wait
ruby-2.2.6 - #removing rubies/ruby-2.2.6 - please wait
ruby-2.2.6 - #removing gems - please wait
ruby-2.2.6 - #removing aliases
ruby-2.2.6 - #removing wrappers - please wait
ruby-2.2.6 - #removing environments - please wait
Now using system ruby.
```

Try to check the Ruby version now.

```
$ ruby -v
ruby 2.6.3p62 (2019-04-16 revision 67580) [universal.x86_64-darwin19]
```

So it's OK now.

## See also

- [Ruby](/ruby.html)
- [macOS Installation](/ruby-macos-installation.html)
