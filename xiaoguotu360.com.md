---
---

## setup

### disable firewalld and selinux

```
systemctl stop firewalld
systemctl disable firewalld
setenforce 0
sed -i '7 s/enforcing/ permissive/' /etc/sysconfig/selinux
sed -i 's/enforcing/disabled/g' /etc/selinux/config
```

### create admin user

```
[root@iZ25xkf099kZ ~]# useradd chenyang
[root@iZ25xkf099kZ ~]# mkdir -p /home/chenyang/.ssh
[root@iZ25xkf099kZ ~]# echo "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAIEArcBHqbUu8vBa+HT1091czMymiYXi7hEOEdaSik3r7RpjS4uZmyvgpuFNiYZOJZCZj1BMyUFAWNGCdm1hiBTez5eXlrDZjgbsVra5BhRkQOjtBmp0Uz6i5q2y1xyqlOxdFG7P3XGFYdJ8+SWj+XC++nw7NmhLMsXp4d96wvbkJ4M= d3vin.chen@gmail.com(rsa-key-20131201)" >> /home/chenyang/.ssh/authorized_keys
[root@iZ25xkf099kZ ~]# chmod 700 /home/chenyang/.ssh/
[root@iZ25xkf099kZ ~]# chmod 600 /home/chenyang/.ssh/authorized_keys
chown chenyang:chenyang /home/chenyang/.ssh/ -R
echo "chenyang ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
```

### nodejs 4.4.4

```
wget https://npm.taobao.org/mirrors/node/v4.4.4/node-v4.4.4-linux-x64.tar.xz -P /tmp
mkdir /tmp/node
tar xvf /tmp/node-v4.4.4-linux-x64.tar.xz --strip-components=1 -C /tmp/node
[chenyang@iZ25xkf099kZ tmp]$ mkdir /tmp/node/etc
[chenyang@iZ25xkf099kZ tmp]$ echo 'prefix=/usr/local' > /tmp/node/etc/npmrc
mv /tmp/node /opt/
[root@iZ25xkf099kZ tmp]# ln -s /opt/node/bin/node /usr/local/bin/node
[root@iZ25xkf099kZ tmp]# ln -s /opt/node/bin/npm /usr/local/bin/npm
```

```
visudo
Defaults    secure_path = /sbin:/bin:/usr/sbin:/usr/bin:/usr/local/bin
```

```
npm config set registry "http://registry.npmjs.org/"
```

### pm2

```
sudo npm install pm2@latest -g --verbose
```

### nginx

```
[root@iZ25xkf099kZ ~]# mv /etc/yum.repos.d/epel.repo /etc/yum.repos.d/epel.repo.backup
[root@iZ25xkf099kZ ~]# wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo
yum install nginx
```

`/etc/nginx/nginx.conf`

```
    location / {
        proxy_pass http://127.0.0.1:8080;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
```

```
sudo systemctl restart nginx
sudo systemctl enable nginx
```

### todo

- disable password login

## References

- [https://www.digitalocean.com/community/tutorials/how-to-set-up-a-node-js-application-for-production-on-centos-7](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-node-js-application-for-production-on-centos-7)
