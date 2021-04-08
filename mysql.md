---
layout: page
title: mysql
---

## installation

### macOS 10.12

#### homebrew

```
$ brew instal mysql
$ brew service start mysql
$ brew service stop mysql
```

#### dmg installer

download dmg file from [https://dev.mysql.com/downloads/mysql/](https://dev.mysql.com/downloads/mysql/)

follow this step to install [https://dev.mysql.com/doc/refman/5.6/en/osx-installation-pkg.html](https://dev.mysql.com/doc/refman/5.6/en/osx-installation-pkg.html)

how to start mysql service [https://dev.mysql.com/doc/refman/5.6/en/osx-installation-launchd.html](https://dev.mysql.com/doc/refman/5.6/en/osx-installation-launchd.html)

```
➜  ~ ll /usr/local/mysql/bin
total 585232
-rwxr-xr-x  1 root  wheel   4.4M Sep 14 03:58 innochecksum
-rwxr-xr-x  1 root  wheel   100K Sep 14 03:58 lz4_decompress
-rwxr-xr-x  1 root  wheel   3.6M Sep 14 03:58 my_print_defaults
-rwxr-xr-x  1 root  wheel   4.0M Sep 14 03:58 myisam_ftdump
-rwxr-xr-x  1 root  wheel   4.1M Sep 14 03:58 myisamchk
-rwxr-xr-x  1 root  wheel   3.9M Sep 14 03:58 myisamlog
-rwxr-xr-x  1 root  wheel   4.0M Sep 14 03:58 myisampack
-rwxr-xr-x  1 root  wheel   4.9M Sep 14 03:58 mysql
-rwxr-xr-x  1 root  wheel    26M Sep 14 03:58 mysql_client_test_embedded
-rwxr-xr-x  1 root  wheel   4.7K Sep 14 03:24 mysql_config
-rwxr-xr-x  1 root  wheel   4.3M Sep 14 03:58 mysql_config_editor
-rwxr-xr-x  1 root  wheel    26M Sep 14 03:58 mysql_embedded
-rwxr-xr-x  1 root  wheel   5.8M Sep 14 03:58 mysql_install_db
-rwxr-xr-x  1 root  wheel   3.7M Sep 14 03:58 mysql_plugin
-rwxr-xr-x  1 root  wheel   4.5M Sep 14 03:58 mysql_secure_installation
-rwxr-xr-x  1 root  wheel   3.7M Sep 14 03:58 mysql_ssl_rsa_setup
-rwxr-xr-x  1 root  wheel   3.6M Sep 14 03:58 mysql_tzinfo_to_sql
-rwxr-xr-x  1 root  wheel   5.3M Sep 14 03:58 mysql_upgrade
-rwxr-xr-x  1 root  wheel   4.6M Sep 14 03:58 mysqladmin
-rwxr-xr-x  1 root  wheel   5.0M Sep 14 03:58 mysqlbinlog
-rwxr-xr-x  1 root  wheel   4.6M Sep 14 03:58 mysqlcheck
-rwxr-xr-x  1 root  wheel    28M Sep 14 03:58 mysqld
-rwxr-xr-x  1 root  wheel    60M Sep 14 03:58 mysqld-debug
-rwxr-xr-x  1 root  wheel    26K Sep 14 03:24 mysqld_multi
-rwxr-xr-x  1 root  wheel    28K Sep 14 03:24 mysqld_safe
-rwxr-xr-x  1 root  wheel   4.6M Sep 14 03:59 mysqldump
-rwxr-xr-x  1 root  wheel   7.3K Sep 14 03:24 mysqldumpslow
-rwxr-xr-x  1 root  wheel   4.5M Sep 14 03:59 mysqlimport
-rwxr-xr-x  1 root  wheel   5.5M Sep 14 03:59 mysqlpump
-rwxr-xr-x  1 root  wheel   4.5M Sep 14 03:59 mysqlshow
-rwxr-xr-x  1 root  wheel   4.6M Sep 14 03:59 mysqlslap
-rwxr-xr-x  1 root  wheel    26M Sep 14 03:59 mysqltest_embedded
-rwxr-xr-x  1 root  wheel   7.3M Sep 14 03:59 mysqlxtest
-rwxr-xr-x  1 root  wheel   3.8M Sep 14 03:59 perror
-rwxr-xr-x  1 root  wheel   3.6M Sep 14 03:59 replace
-rwxr-xr-x  1 root  wheel   3.7M Sep 14 03:59 resolve_stack_dump
-rwxr-xr-x  1 root  wheel   3.6M Sep 14 03:59 resolveip
-rwxr-xr-x  1 root  wheel    64K Sep 14 03:59 zlib_decompress
```

reset initial password before connect mysql service with other client, e.g. mySQLWorkbench, or you will see this error:

> You must reset your password using ALTER USER statement before executing this statement.

```
/usr/local/mysql/bin/mysql -u root -p
```

```
ALTER USER 'root'@'localhost' IDENTIFIED BY 'MY_NEW_PASSWORD';
```

## get password from keychain

```
sudo pip install --upgrade pip
sudo apt-get install python-gnomekeyring
pip install --upgrade --user gkeyring
~/.local/bin/gkeyring --id=2045
~/.local/bin/gkeyring --all
~/.local/bin/gkeyring --id=2045 | cut -f3
```

## reset password to null

[https://stackoverflow.com/a/36234358/4685522](https://stackoverflow.com/a/36234358/4685522)

```
use mysql;
update user set authentication_string=password(''), plugin='mysql_native_password' where user='root';
```

## Client

- [https://sequelpro.com](https://sequelpro.com)

## JSON_EXTRACT

```
+----+---------------------------------------------------+
| id | json                                             |
+----+---------------------------------------------------+
| 1  | {"name": "foo"}                            |
| 2  | {"name": ""}                            |
| 3  | {"value": "bar"} |
+----+---------------------------------------------------+
```

```
select * from table where JSON_EXTRACT(extra, "$.name") != '' -- print 1
select * from table where JSON_EXTRACT(extra, "$.name") = '' -- print 2
```

## refs

- [https://github.com/kparal/gkeyring](https://github.com/kparal/gkeyring)
- [https://dev.mysql.com/doc/workbench/en/wb-mysql-connections-vault.html](https://dev.mysql.com/doc/workbench/en/wb-mysql-connections-vault.html)