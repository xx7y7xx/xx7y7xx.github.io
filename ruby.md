---
layout: page
title: Ruby
---

## Installation

- [macOS](/ruby-macos-installation.html)

### Ubuntu 16.04

```
sudo apt-add-repository ppa:brightbox/ruby-ng
sudo apt-get update
sudo apt-get install ruby2.1 ruby2.1-dev ruby-switch -y
sudo ruby-switch --set ruby2.1
```

最早参照[http://stackoverflow.com/a/32569363](http://stackoverflow.com/a/32569363)

更多参照官方文档：[https://www.brightbox.com/docs/ruby/ubuntu/](https://www.brightbox.com/docs/ruby/ubuntu/)

可以删除已经安装的 ppa

```
sudo add-apt-repository --remove ppa:brightbox/ruby-ng
```

### How To Install Ruby with rbenv on CentOS 7 for jenkins job

#### Install rbenv

```
sudo yum install -y git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel
```

`jenkins` is Jenkins user, will run ruby

```
vim /etc/passwd
```

change `/bin/false` to `/bin/bash` to allow login to jenkins user

```
jenkins:x:996:994:Jenkins Automation Server:/var/lib/jenkins:/bin/false
```

```
su jenkins
```

Below installs rbenv into your home directory

```
cd
git clone https://github.com/rbenv/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile
exec $SHELL
```

setup `$PATH`

```
bash-4.2$ echo $PATH
/sbin:/bin:/usr/sbin:/usr/bin

bash-4.2$ source .bash_profile

bash-4.2$ echo $PATH
/var/lib/jenkins/.rbenv/plugins/ruby-build/bin:/var/lib/jenkins/.rbenv/shims:/var/lib/jenkins/.rbenv/bin:/sbin:/bin:/usr/sbin:/usr/bin
```

As `jenkins` user

```
bash-4.2$ rbenv install -v 2.2.1
bash-4.2$ rbenv global 2.2.1
bash-4.2$ ruby -v
ruby 2.2.1p85 (2015-02-26 revision 49769) [x86_64-linux]
```

## Compare vs Node.js

|                                | Ruby                                         | Node.js                            |
| :----------------------------- | :------------------------------------------- | :--------------------------------- |
|                                | [Gems](https://rubygems.org)                 | [npm packages](https://npmjs.com/) |
|                                | gem install bundler                          | ???                                |
| Project config file            | Gemfile                                      | package.json                       |
| Project lock                   | Gemfile.lock                                 | package-lock.json                  |
|                                | [Bundler](https://rubygems.org/gems/bundler) | [npm](https://www.npmjs.com/)      |
| Install dependencies in config | bundle install                               | npm install                        |
| Run project                    | bundle exec jekyll serve                     | npm start                          |

## See also

- [macOS Installation](/ruby-macos-installation.html)
- [Ruby Gem](/gem.html)

## References

- [https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-centos-7](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-centos-7)
