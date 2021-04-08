---
title: Trac
layout: page
---

## InterMapTxt

Modify wiki:/InterMapTxt to append new item

Example:

```
github           https://github.com/$1/workspace/issues/$2
```

## email notification

random select email address ( 比如163等邮箱每天发送邮件数量有限制，可以这么解决，申请多个邮箱，使用随机数选择使用哪个来发送。 )

{% highlight diff %}
--- trac/notification.py.backup20150806 2015-08-06 03:03:32.730525463 +0800
+++ trac/notification.py        2015-08-06 04:55:59.708922262 +0800
@@ -36,6 +36,8 @@
         '[a-zA-Z](?:[-a-zA-Z\d]*[a-zA-Z\d])?' # TLD
         )

+import random
+RANDOM_NUMBER = random.randint(1, 9)

 class IEmailSender(Interface):
     """Extension point interface for components that allow sending e-mail."""
@@ -160,10 +162,14 @@
             server.starttls()
             server.ehlo()
         if self.smtp_user:
-            server.login(self.smtp_user.encode('utf-8'),
+            #[chenyang] fuck mail.163.com
+            #server.login(self.smtp_user.encode('utf-8'),
+            server.login(self.smtp_user.replace('*', str(RANDOM_NUMBER)).encode('utf-8'),
                          self.smtp_password.encode('utf-8'))
         start = time.time()
-        server.sendmail(from_addr, recipients, message)
+        #[chenyang] fuck mail.163.com
+        #server.sendmail(from_addr, recipients, message)
+        server.sendmail(from_addr.replace('*', str(RANDOM_NUMBER)), recipients, message)
         t = time.time() - start
         if t > 5:
             self.log.warning('Slow mail submission (%.2f s), '
@@ -328,7 +334,9 @@
         if not from_email:
             from_email = config.get('smtp_from')
             from_name = config.get('smtp_from_name') or self.env.project_name
-        self.replyto_email = config.get('smtp_replyto')
+        #[chenyang] fuck mail.163.com
+        #self.replyto_email = config.get('smtp_replyto')
+        self.replyto_email = config.get('smtp_replyto').replace('*', str(RANDOM_NUMBER))
         self.from_email = from_email or self.replyto_email
         self.from_name = from_name
         if not self.from_email and not self.replyto_email:
{% endhighlight %}

`trac.ini`

    smtp_from = trac_notification*@wware.org
    smtp_replyto = trac_notification*@wware.org
    smtp_user = trac_notification*@wware.org
