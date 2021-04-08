---
title: ssh
---

## key gen

```
ssh-keygen -t rsa -b 4096 -C "d3vin.chen@gmail.com" -N "" -f /tmp/id_rsa
```

## encrypt ssh private key

Use openssl to encrypt an unencrypted private ssh key. Don’t overwrite the unencrypted one if you don’t want to.

```
openssl rsa -aes256 -in /tmp/id_rsa -out /tmp/id_rsa.enc
```

## script to modify `sshd_config`

Disable password auth.

```shell
file=/etc/ssh/sshd_config
cp -p $file $file.old &&
awk '
$1=="PasswordAuthentication" {$2="no"}
$1=="PubkeyAuthentication" {$2="yes"}
{print}
' $file.old > $file
```
