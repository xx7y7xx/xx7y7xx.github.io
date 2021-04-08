---
layout: page
title: Raspberry Pi
---
## 目录

- [GPIO入门](rpi_gpio)

## 配件

- raspberry pi (taobao.com)
- hdmi cable (jd.com)
- display (dell 24 inch)
- kb/ms (logitech)
- sd card
- nic 
- power cable


## archlinux

1. 插上网线，在pc上使用nmap之类扫出ip地址
2. 使用ip地址ssh上去，用户名和密码都是root
3. 安装wireless，参照[http://raspberrypi.stackexchange.com/a/7992](http://raspberrypi.stackexchange.com/a/7992)
4. 将wireless设定为开机启动。[http://unix.stackexchange.com/a/83108](http://unix.stackexchange.com/a/83108)
5. 显示cpu温度：[https://wiki.archlinux.org/index.php/Raspberry_Pi#Temperature](https://wiki.archlinux.org/index.php/Raspberry_Pi#Temperature)
6. 安装apache和php。[http://kiros.co.uk/blog/installing-lamp-linuxapachemysqlphp-on-the-raspberry-pi/](http://kiros.co.uk/blog/installing-lamp-linuxapachemysqlphp-on-the-raspberry-pi/)

## raspbian

### 配置wifi

参照：

- [http://www.howtogeek.com/167425/how-to-setup-wi-fi-on-your-raspberry-pi-via-the-command-line/](http://www.howtogeek.com/167425/how-to-setup-wi-fi-on-your-raspberry-pi-via-the-command-line/)
- id_str是关键，请参照[http://www.electroschematics.com/9496/static-manual-ip-wireless-raspberry-pi/](http://www.electroschematics.com/9496/static-manual-ip-wireless-raspberry-pi/)
- 关于debian的网络设置 [https://wiki.debian.org/NetworkConfiguration](https://wiki.debian.org/NetworkConfiguration)

最终效果

    pi@raspberrypi ~ $ cat /etc/network/interfaces
    auto lo
    
    iface lo inet loopback
    iface eth0 inet dhcp
    
    allow-hotplug wlan0
    iface wlan0 inet manual
    wpa-roam /etc/wpa_supplicant/wpa_supplicant.conf
    iface chenyang inet static
        address 192.168.12.3
        netmask 255.255.255.0
        gateway 192.168.12.1
    
    iface default inet dhcp

    pi@raspberrypi ~ $ sudo cat /etc/wpa_supplicant/wpa_supplicant.conf
    #ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
    #update_config=1
    
    network={
    ssid="abcdefghi"
    psk="123456789"
    
    # Protocol type can be: RSN (for WP2) and WPA (for WPA1)
    proto=RSN
    
    # Key management type can be: WPA-PSK or WPA-EAP (Pre-Shared or Enterprise)
    key_mgmt=WPA-PSK
    
    # Pairwise can be CCMP or TKIP (for WPA2 or WPA1)
    pairwise=CCMP TKIP
    
    #Authorization option should be OPEN for both WPA1/WPA2 (in less commonly used are SHARED and LEAP)
    auth_alg=OPEN
    
    # used in /etc/network/interface
    id_str="chenyang"
    }

## 配置相机

挂载samba，修改/etc/fstab文件
    //192.168.12.10/cloud   /home/pi/mnt/192.168.12.10      cifs    username=devin,password=123456,uid=1000     0       0


    pi@raspberrypi ~ $ pwd
    /home/pi
    pi@raspberrypi ~ $ cat camera.sh
    #!/bin/bash
    
    DATE=$(date +"%Y-%m-%d_%H%M")
    
    raspistill -vf -hf -o /home/pi/mnt/192.168.12.10/$DATE.jpg
    pi@raspberrypi ~ $ cat /etc/cron.d/camera
    *       *       *       *       *       pi      /home/pi/camera.sh

## 时间不正确

原型raspi-config重新设定一下time zone，比较将time zone设定为shanghai，然后时间就恢复正确了。

目前不确定是什么问题引起的时间不正确的问题。 


## 需要看的文章

http://www.raspberrypi-spy.co.uk/2012/08/20x4-lcd-module-control-using-python/
https://projects.drogon.net/wp-content/uploads/2012/07/lcd4_bb.png
https://projects.drogon.net/raspberry-pi/wiringpi/lcd-library/
https://projects.drogon.net/raspberry-pi/gpio-examples/lcd-interface/
http://www.raspberrypi-spy.co.uk/2012/07/16x2-lcd-module-control-using-python/
https://learn.adafruit.com/assets/18260
https://learn.adafruit.com/drive-a-16x2-lcd-directly-with-a-raspberry-pi/wiring
https://learn.adafruit.com/character-lcd-with-raspberry-pi-or-beaglebone-black/wiring
https://www.google.com.hk/search?newwindow=1&c2coff=1&rlz=1C1CHUN_zh-CNCN515CN515&es_sm=93&q=raspberry+pi+lcd+1602&oq=raspberry+pi+lcd+1602&gs_l=serp.3...10911.16980.0.17118.17.15.0.0.0.1.418.1658.2-3j0j2.5.0.msedrc...0...1c.1.57.serp..13.4.1369.eYhY1bgIQR4