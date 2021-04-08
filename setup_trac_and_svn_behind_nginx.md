---
title: Setup Trac and SVN behind NGINX
---

## Arch

Pass requests from NGINX to proxy servers.

```
             NGINX

            /      \

 Trac (tracd)      Apache (mod_dav_svn)

                     \
       
                     SVN
```

- Trac
  - `http://dev.test.com/proj-1`
  - `http://dev.test.com/proj-2`
- SVN
  - `http://dev.test.com/svn/proj-1`
  - `http://dev.test.com/svn/proj-2`

## NGINX

`nginx/conf/sites-available/dev`

```
server {
  listen          80;
  server_name     dev.test.com;

  access_log      /var/log/nginx/trac.wware.access.log;
  error_log       /var/log/nginx/trac.wware.error.log;

  location / {
    proxy_pass http://127.0.0.1:3333;
    proxy_redirect default;
    proxy_set_header Host $host;
    auth_basic "Trac";
    auth_basic_user_file /path_to_auth/htpasswd;
  }

  location /svn {
    proxy_pass http://127.0.0.1:4444;
    proxy_redirect default;
    proxy_set_header Host $host;
  }
}
```

## SVN

```
$ sudo yum install httpd subversion mod_dav_svn
$ sudo mkdir -p /svn_repo/proj-1
$ sudo mkdir -p /svn_repo/proj-2
$ sudo svnadmin create /svn_repo/proj-1
$ sudo svnadmin create /svn_repo/proj-2
```

`httpd/conf.d/subversion.conf`

```
LoadModule dav_svn_module     modules/mod_dav_svn.so
LoadModule authz_svn_module   modules/mod_authz_svn.so

<Location '/'>
    AuthType Basic
    AuthName "Trac"
    AuthUserFile /path_to_auth/htpasswd
    Require valid-user
</Location>

<Location /svn>
        DAV svn
        SVNParentPath /svn_repo
        AuthzSVNAccessFile /svn_repo/authz
        AuthType Basic
        AuthName "Subversion repos"
        AuthUserFile /path_to_auth/htpasswd
        Require valid-user
</Location>
```

`httpd/conf/httpd.conf`

```
#Listen 12.34.56.78:80
Listen 127.0.0.1:4444
```

Test svn checkout:

```
svn checkout http://dev.test.com/svn/proj-1 proj-1 --username test --password 1234
```

## Trac

```
$ sudo yum install trac subversion-python
$ mkdir -p /trac/proj-1
$ mkdir -p /trac/proj-2
$ trac-admin /trac/proj-1 initenv
$ trac-admin /trac/proj-2 initenv
```

Start `tracd`

```
$ sudo /usr/bin/python /usr/sbin/tracd -d -p 3333 --pidfile=/var/run/tracd.3333 --protocol=http -e /trac --basic-auth="*,/path_to_auth/htpasswd,Trac"
```

### Enable Trac SVN components

`trac/proj-1/conf/trac.ini`

```
[components]
tracopt.versioncontrol.svn.* = enabled
```

```
$ sudo trac-admin /trac/proj-1 repository add "proj-1" /svn_repo/proj-1
$ sudo trac-admin /trac/proj-1 repository resync "proj-1"
```

### SVN commit hook update ticket comment

`trac/proj-1/conf/trac.ini`

```
[components]
tracopt.ticket.commit_updater.* = enabled
```

Add SVN hooks:

`/svn_repo/proj-1/hooks/post-commit`

```
/usr/bin/trac-admin /trac/proj-1/ changeset added "$REPOS" "$REV" &
```

### Enable debug log

`trac/proj-1/conf/trac.ini`

```
[logging]
log_file = trac.log
# log_format = <inherited>
log_level = DEBUG
log_type = file
```

Log file is located in `/trac/proj-1/log/trac.log`

### SMTP

Example for 163.com

`trac/proj-1/conf/trac.ini`

```
[notification]
smtp_enabled = true
smtp_from = trac-notification@test.com
smtp_password = 123456
smtp_port = 25
smtp_replyto = trac-notification@test.com
smtp_server = smtp.ym.163.com
smtp_user = trac-notification@test.com
use_tls = false
```

### Create ADMIN role user

Make sure `admin` is a valid user.

```
$ sudo trac-admin /trac/proj-1/ permission add admin TRAC_ADMIN
```

## FAQ

- restart `tracd`
- restart `httpd`
- restart `nginx`
- the nignx user may not the same as httpd user, check the file permission when svn hooks try to update ticket comment (modify `trac.db` file).
