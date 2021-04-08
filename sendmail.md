---
layout: page
title: sendmail
---

`sendmail` is MTA (Mail Transfer Agent)

`mailx` is MUA (Mail User Agent)

## Usage

```
mail -s "Subject" devin.chen@gmail.com
/bin/mail -s "Subject" devin.chen@gmail.com
mailx -s "Subject" devin.chen@gmail.com
/usr/bin/mailx -s "Subject" devin.chen@gmail.com
```

input

Ctrl+D to finish

## 发送邮件

```
echo -e "Email content" | mailx -v -s "Email subject" -S smtp-auth=login -S smtp=smtp://mail.bar.com:25 -S from="foo@bar.com(Notify)" -S smtp-auth-user=chenyangf@bar.com -S smtp-auth-password=123456 foo@gmail.com
```

## FAQ

### send-mail: fatal: parameter inet_interfaces: no local interface found for ::1

[https://www.centos.org/forums/viewtopic.php?t=42362](https://www.centos.org/forums/viewtopic.php?t=42362)

`/etc/postfix/main.cf`

```
inet_interfaces = 192.168.0.78
```

```
/etc/init.d/postfix restart
```

## References

- [https://en.wikipedia.org/wiki/Email_agent_(infrastructure)](https://en.wikipedia.org/wiki/Email_agent_(infrastructure))