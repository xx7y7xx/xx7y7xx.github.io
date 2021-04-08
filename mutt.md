---
layout: page
title: Mutt
---

## install mutt on ubuntu 16.04

```
sudo apt install mutt
```

```
mkdir -p ~/.mutt/cache/headers
mkdir ~/.mutt/cache/bodies
touch ~/.mutt/certificates
```

```
touch ~/.mutt/muttrc
```

```
vim ~/.mutt/muttrc
```

```
set ssl_starttls=yes
set ssl_force_tls=yes

set imap_user = 'change_this_user_name@gmail.com'
set imap_pass = 'PASSWORD'

set from='change_this_user_name@gmail.com'
set realname='Your Name'

set folder = imaps://imap.gmail.com/
set spoolfile = imaps://imap.gmail.com/INBOX
set postponed="imaps://imap.gmail.com/[Gmail]/Drafts"

set header_cache = "~/.mutt/cache/headers"
set message_cachedir = "~/.mutt/cache/bodies"
set certificate_file = "~/.mutt/certificates"

set smtp_url = 'smtps://change_this_user_name@gmail.com:PASSWORD@smtp.gmail.com:465/'

set move = no
set imap_keepalive = 900
```

[https://security.google.com/settings/security/apppasswords](https://security.google.com/settings/security/apppasswords)

Generate application password, and replace `PASSWORD` with this password.

```
$ mutt
```

## References

- [https://unix.stackexchange.com/questions/226936/how-to-install-setup-mutt-with-gmail-on-centos-and-ubuntu](https://unix.stackexchange.com/questions/226936/how-to-install-setup-mutt-with-gmail-on-centos-and-ubuntu)
- [https://www.codyhiar.com/blog/getting-mutt-setup-with-gmail-using-2-factor-auth-on-ubuntu-14-04/](https://www.codyhiar.com/blog/getting-mutt-setup-with-gmail-using-2-factor-auth-on-ubuntu-14-04/)