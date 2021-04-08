---
layout: page
title: Ruby macOS Installation
---

## macOS 10.12

First of all, you should choose homebrew or rvm(or rbenv)

macOS shiped with ruby

```
$ ruby -v
ruby 2.0.0p648 (2015-12-16 revision 53162) [universal.x86_64-darwin16]
```

### install with homebrew

you could upgrade to a new ruby

```
brew install ruby
```

open a new terminal window

```
$ ruby -v
ruby 2.4.2p198 (2017-09-14 revision 59899) [x86_64-darwin16]
```

### Install with RVM

Because the default version of Ruby which shiped from macOS Sierra (Version 10.12) is v2.0. By using RVM, you could install another version, say v2.2, along with v2.0.

Install RVM first.

```
$ \curl -sSL https://get.rvm.io | bash -s stable
```

Then install Ruby v2.2 using `rvm` command.

```
$ rvm install ruby-2.2
```

Then check the version.

```
$ ruby -v
```

Can also use `rvm list` to check all the installed Ruby versions.

```
$ rvm list

rvm rubies

=* ruby-2.2.6 [ x86_64 ]

# => - current
# =* - current && default
#  * - default
```

#### Uninstall

I'm using macOS Catalina 10.15 now which comes with ruby 2.6.3.
But when I'm running `ruby`, it uses an old version 2.2.

```
$ ruby -v
ruby 2.2.6p396 (2016-11-15 revision 56800) [x86_64-darwin16]
```

After checking with `rvm list`, I found `2.2.6` was installed.
So I try to uninstall it with this command.

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

```
$ ruby -v
ruby 2.6.3p62 (2019-04-16 revision 67580) [universal.x86_64-darwin19]
```

## See also

- [Ruby](/ruby.html)
