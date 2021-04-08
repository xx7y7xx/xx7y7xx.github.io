---
layout: page
title: codeanywhere
---

## develop jekyll blog / website

create a ruby container (OS is ubuntu)

```
cabox@box-codeanywhere:~/workspace$ ruby -v
ruby 2.1.2p95 (2014-05-08 revision 45877) [x86_64-linux]
cabox@box-codeanywhere:~/workspace$ gem -v
2.2.2
```

install jekyll

```
gem install jekyll bundler
```

```
$ cat ~/.ssh/id_rsa.pub
ssh-rsa AAAAB3NzaC1y...uMUs3 jekyll@codeanywhere
```

upload pub key to github

```
jekyll serve -H 0.0.0.0
```

access url http://{containerName}-{userId}{123456}.codeanyapp.com:4000/

## References

- [http://intenseagile.com/running-jekyll-on-codeanywhere/](http://intenseagile.com/running-jekyll-on-codeanywhere/)