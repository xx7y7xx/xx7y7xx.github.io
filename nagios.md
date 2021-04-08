---
layout: page
title: nagios
---

## install on centos 7

prepare

```
sudo yum install php
sudo systemctl restart httpd.service
```

Install Build Dependencies

```
sudo yum install gcc glibc glibc-common gd gd-devel make net-snmp openssl-devel xinetd unzip
```

Create Nagios User and Group

```
sudo useradd nagios
sudo groupadd nagcmd
sudo usermod -a -G nagcmd nagios
```

Install Nagios Core

```
cd ~
curl -L -O https://assets.nagios.com/downloads/nagioscore/releases/nagios-4.1.1.tar.gz
```

```
tar xvf nagios-4.1.1.tar.gz
cd nagios-4.1.1/
./configure --with-command-group=nagcmd
make all
sudo make install
sudo make install-commandmode
sudo make install-init
sudo make install-config
sudo make install-webconf
```

```
sudo usermod -G nagcmd apache
```

Install Nagios Plugins

```
cd ~
curl -L -O http://nagios-plugins.org/download/nagios-plugins-2.1.1.tar.gz
```

```
tar xvf nagios-plugins-2.1.1.tar.gz
cd nagios-plugins-2.1.1/
./configure --with-nagios-user=nagios --with-nagios-group=nagios --with-openssl
make
sudo make install
```

Install NRPE

```
cd ~
curl -L -O http://downloads.sourceforge.net/project/nagios/nrpe-2.x/nrpe-2.15/nrpe-2.15.tar.gz
```

```
tar xvf nrpe-2.15.tar.gz
cd nrpe-2.15/
./configure --enable-command-args --with-nagios-user=nagios --with-nagios-group=nagios --with-ssl=/usr/bin/openssl --with-ssl-lib=/usr/lib/x86_64-linux-gnu
make all
sudo make install
sudo make install-xinetd
sudo make install-daemon-config
```

Restart the xinetd service to start NRPE:

```
sudo service xinetd restart
```

Organize Nagios Configuration

```
vim /usr/local/nagios/etc/nagios.cfg
```

Now find an uncomment this line by deleting the #:

```
#cfg_dir=/usr/local/nagios/etc/servers
```

Now create the directory that will store the configuration file for each server that you will monitor:

```
mkdir /usr/local/nagios/etc/servers
```

```
cat /usr/local/nagios/etc/servers/10.3.14.1.cfg
```

```
define host {
        use                             linux-server
        host_name                       dot1
        alias                           My first Apache server
        address                         10.3.14.1
        max_check_attempts              5
        check_period                    24x7
        notification_interval           30
        notification_period             24x7
}

define service {
        use                             generic-service
        host_name                       dot1
        service_description             PING
        check_command                   check_ping!100.0,20%!500.0,60%
}

define service {
        use                             generic-service
        host_name                       dot1
        service_description             SSH
        check_command                   check_ssh
        notifications_enabled           0
}

# Define a service to check the disk space of the root partition
# on the local machine.  Warning if < 20% free, critical if
# < 10% free space on partition.

define service{
        use                             generic-service         ; Name of service template to use
        host_name                       dot1
        service_description             Root Partition
	check_command			check_nrpe!check_root_part
        }
```

Configure Nagios Contacts

```
vim /usr/local/nagios/etc/objects/contacts.cfg
```

Find the email directive, and replace its value (the highlighted part) with your own email address:

```
email                           foo@bar.com        ; <<***** CHANGE THIS TO YOUR EMAIL ADDRESS ******
```

Configure check_nrpe Command

```
vim /usr/local/nagios/etc/objects/commands.cfg
```

Add the following to the end of the file:

```
define command{
        command_name check_nrpe
        command_line $USER1$/check_nrpe -H $HOSTADDRESS$ -c $ARG1$
}
```

Configure Apache

```
sudo htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin
```

```
sudo systemctl start nagios.service
```

```
Failed to start nagios.service: Unit not found.
```

[https://serverfault.com/a/774501](https://serverfault.com/a/774501)

```
vim /etc/systemd/system/nagios.service
```

```
[Unit]
Description=Nagios
BindTo=network.target


[Install]
WantedBy=multi-user.target

[Service]
User=nagios
Group=nagios
Type=simple
ExecStart=/usr/local/nagios/bin/nagios /usr/local/nagios/etc/nagios.cfg
```

```
sudo systemctl start nagios.service
sudo systemctl restart httpd.service
```

```
sudo chkconfig nagios on
```

apache vhost

```
vim /etc/httpd/sites-available/nagios.yyssc.org.conf
```

```
<VirtualHost *:80>

    ServerName nagios.yyssc.org
    DocumentRoot /usr/local/nagios/share
    ErrorLog /var/www/nagios.yyssc.org/error.log
    CustomLog /var/www/nagios.yyssc.org/requests.log combined

    ScriptAlias /cgi-bin "/usr/local/nagios/sbin"
</VirtualHost>
```

```
mkdir /var/www/nagios.yyssc.org
```

```
sudo ln -s /etc/httpd/sites-available/nagios.yyssc.org.conf /etc/httpd/sites-enabled/nagios.yyssc.org.conf
```

```
sudo apachectl restart
```

### email notification

By default, Nagios Mail notification is sent using `/bin/mail` command

`/usr/local/nagios/etc/objects/commands.cfg`

```
# 'notify-host-by-email' command definition
define command{
	command_name	notify-host-by-email
	command_line	/usr/bin/printf "%b" "***** Nagios *****\n\nNotification Type: $NOTIFICATIONTYPE$\nHost: $HOSTNAME$\nState: $HOSTSTATE$\nAddress: $HOSTADDRESS$\nInfo: $HOSTOUTPUT$\n\nDate/Time: $LONGDATETIME$\n" | /bin/mail -s "** $NOTIFICATIONTYPE$ Host Alert: $HOSTNAME$ is $HOSTSTATE$ **" $CONTACTEMAIL$
	}

# 'notify-service-by-email' command definition
define command{
	command_name	notify-service-by-email
	command_line	/usr/bin/printf "%b" "***** Nagios *****\n\nNotification Type: $NOTIFICATIONTYPE$\n\nService: $SERVICEDESC$\nHost: $HOSTALIAS$\nAddress: $HOSTADDRESS$\nState: $SERVICESTATE$\n\nDate/Time: $LONGDATETIME$\n\nAdditional Info:\n\n$SERVICEOUTPUT$\n" | /bin/mail -s "** $NOTIFICATIONTYPE$ Service Alert: $HOSTALIAS$/$SERVICEDESC$ is $SERVICESTATE$ **" $CONTACTEMAIL$
	}
```

```
[root@server222 ~]# which mail
/usr/bin/which: no mail in (/sbin:/bin:/usr/sbin:/usr/bin)
[root@server222 ~]# ls -l /bin/mail
ls: cannot access /bin/mail: No such file or directory
```

```
sudo yum install mailx
```

```
# ls -l /bin/mail
lrwxrwxrwx 1 root root 5 May  3  2016 /bin/mail -> mailx
# which mailx
/usr/bin/mailx
# ls -l /usr/bin/mail
lrwxrwxrwx 1 root root 5 May  3  2016 /usr/bin/mail -> mailx
# ls -l /usr/bin/mailx
-rwxr-xr-x 1 root root 392784 Dec 17  2014 /usr/bin/mailx
```

```
# 'notify-host-by-email' command definition
define command{
        command_name    notify-host-by-email
        #command_line   /usr/bin/printf "%b" "***** Nagios *****\n\nNotification Type: $NOTIFICATIONTYPE$\nHost: $HOSTNAME$\nState: $HOSTSTATE$\nAddress: $HOSTADDRESS$\nInfo: $HOSTOUTPUT$\n\nDate/Time: $LONGDATETIME$\n" | /bin/mail -s "** $NOTIFICATIONTYPE$ Host Alert: $HOSTNAME$ is $HOSTSTATE$ **" $CONTACTEMAIL$
        command_line    /usr/bin/printf "%b" "***** Nagios *****\n\nNotification Type: $NOTIFICATIONTYPE$\nHost: $HOSTNAME$\nState: $HOSTSTATE$\nAddress: $HOSTADDRESS$\nInfo: $HOSTOUTPUT$\n\nDate/Time: $LONGDATETIME$\n" | /usr/bin/mailx -v -s "** $NOTIFICATIONTYPE$ Host Alert: $HOSTNAME$ is $HOSTSTATE$ **" -S smtp-auth=login -S smtp="smtp://mail.bar.com:25" -S from="chenyangf@bar.com(Notify)" -S smtp-auth-user=chenyangf@bar.com -S smtp-auth-password=ufida2013% $CONTACTEMAIL$
        }

# 'notify-service-by-email' command definition
define command{
        command_name    notify-service-by-email
        #command_line   /usr/bin/printf "%b" "***** Nagios *****\n\nNotification Type: $NOTIFICATIONTYPE$\n\nService: $SERVICEDESC$\nHost: $HOSTALIAS$\nAddress: $HOSTADDRESS$\nState: $SERVICESTATE$\n\nDate/Time: $LONGDATETIME$\n\nAdditional Info:\n\n$SERVICEOUTPUT$\n" | /bin/mail -s "** $NOTIFICATIONTYPE$ Service Alert: $HOSTALIAS$/$SERVICEDESC$ is $SERVICESTATE$ **" $CONTACTEMAIL$
        command_line    /usr/bin/printf "%b" "***** Nagios *****\n\nNotification Type: $NOTIFICATIONTYPE$\n\nService: $SERVICEDESC$\nHost: $HOSTALIAS$\nAddress: $HOSTADDRESS$\nState: $SERVICESTATE$\n\nDate/Time: $LONGDATETIME$\n\nAdditional Info:\n\n$SERVICEOUTPUT$\n" | /usr/bin/mailx -v -s "** $NOTIFICATIONTYPE$ Service Alert: $HOSTALIAS$/$SERVICEDESC$ is $SERVICESTATE$ **" -S smtp-auth=login -S smtp="smtp://mail.bar.com:25" -S from="chenyangf@bar.com(Notify)" -S smtp-auth-user=chenyangf@bar.com -S smtp-auth-password=ufida2013% $CONTACTEMAIL$
        }
```

### change log timestamps (Convert Timestamp To Human Readable Format)

[https://kb.op5.com/display/FAQ/Converting+unix+timestamps+in+nagios.log#sthash.cds0Ernl.dpbs](https://kb.op5.com/display/FAQ/Converting+unix+timestamps+in+nagios.log#sthash.cds0Ernl.dpbs)

[https://geekpeek.net/nagios-log-convert-timestamp/](https://geekpeek.net/nagios-log-convert-timestamp/)

`/usr/local/nagios/var/nagios.log`

```
[1503552052] wproc: Registry request: name=Core Worker 2707;pid=2707
[1503552052] wproc: Registry request: name=Core Worker 2706;pid=2706
[1503552052] wproc: Registry request: name=Core Worker 2705;pid=2705
[1503552052] wproc: Registry request: name=Core Worker 2709;pid=2709
[1503552052] wproc: Registry request: name=Core Worker 2710;pid=2710
[1503552052] wproc: Registry request: name=Core Worker 2708;pid=2708
[1503552053] Successfully launched command file worker with pid 2736
```

```
cat /usr/local/nagios/var/nagios.log | perl -pe 's/(\d+)/localtime($1)/e'
```

```
[Thu Aug 24 13:20:52 2017] wproc: Registry request: name=Core Worker 2707;pid=2707
[Thu Aug 24 13:20:52 2017] wproc: Registry request: name=Core Worker 2706;pid=2706
[Thu Aug 24 13:20:52 2017] wproc: Registry request: name=Core Worker 2705;pid=2705
[Thu Aug 24 13:20:52 2017] wproc: Registry request: name=Core Worker 2709;pid=2709
[Thu Aug 24 13:20:52 2017] wproc: Registry request: name=Core Worker 2710;pid=2710
[Thu Aug 24 13:20:52 2017] wproc: Registry request: name=Core Worker 2708;pid=2708
[Thu Aug 24 13:20:53 2017] Successfully launched command file worker with pid 2736
```

### Monitor a CentOS 7 Host with NRPE

```
sudo yum install epel-release
sudo yum install nrpe nagios-plugins-all
```

```
vim /etc/nagios/nrpe.cfg
```

```
allowed_hosts=127.0.0.1,::1,172.20.4.222
```

```
sudo systemctl start nrpe.service
sudo systemctl enable nrpe.service
```

after mofify nrpe.cfg

```
systemctl restart nrpe
```

## References

- [https://www.digitalocean.com/community/tutorials/how-to-install-nagios-4-and-monitor-your-servers-on-centos-7](https://www.digitalocean.com/community/tutorials/how-to-install-nagios-4-and-monitor-your-servers-on-centos-7)
- [https://askubuntu.com/a/481174](https://askubuntu.com/a/481174)
- [https://access.redhat.com/documentation/en-US/Red_Hat_Storage/3/html/Console_Administration_Guide/Configuring_Nagios_to_Send_Mail_Notifications.html](https://access.redhat.com/documentation/en-US/Red_Hat_Storage/3/html/Console_Administration_Guide/Configuring_Nagios_to_Send_Mail_Notifications.html)