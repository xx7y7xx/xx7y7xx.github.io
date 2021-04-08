---
layout: page
title: KVM
---

## 安装virtinst

    $ sudo apt-get install qemu virtinst

## 查看支持的类型

    $ sudo virsh capabilities

    <capabilities>
    
      <host>
        <uuid>35304535-3439-4236-3533-3736ffffffff</uuid>
        <cpu>
          <arch>x86_64</arch>
          <model>Opteron_G3</model>
          <vendor>AMD</vendor>
          <topology sockets='1' cores='2' threads='1'/>
          <feature name='wdt'/>
          <feature name='skinit'/>
          <feature name='osvw'/>
          <feature name='3dnowprefetch'/>
          <feature name='cr8legacy'/>
          <feature name='extapic'/>
          <feature name='cmp_legacy'/>
          <feature name='3dnow'/>
          <feature name='3dnowext'/>
          <feature name='pdpe1gb'/>
          <feature name='fxsr_opt'/>
          <feature name='mmxext'/>
          <feature name='ht'/>
          <feature name='vme'/>
        </cpu>
        <power_management>
          <suspend_mem/>
          <suspend_disk/>
          <suspend_hybrid/>
        </power_management>
        <migration_features>
          <live/>
          <uri_transports>
            <uri_transport>tcp</uri_transport>
          </uri_transports>
        </migration_features>
        <topology>
          <cells num='1'>
            <cell id='0'>
              <cpus num='2'>
                <cpu id='0'/>
                <cpu id='1'/>
              </cpus>
            </cell>
          </cells>
        </topology>
        <secmodel>
          <model>apparmor</model>
          <doi>0</doi>
        </secmodel>
      </host>
    
      <guest>
        <os_type>hvm</os_type>
        <arch name='i686'>
          <wordsize>32</wordsize>
          <emulator>/usr/bin/qemu-system-x86_64</emulator>
          <machine>pc-1.0-qemu-kvm</machine>
          <machine canonical='pc-1.0-qemu-kvm'>pc-1.0-precise</machine>
          <machine canonical='pc-1.0'>pc</machine>
          <machine>pc-1.0</machine>
          <machine>pc-0.14</machine>
          <machine>pc-0.13</machine>
          <machine>pc-0.12</machine>
          <machine>pc-0.11</machine>
          <machine>pc-0.10</machine>
          <machine>isapc</machine>
          <domain type='qemu'>
          </domain>
          <domain type='kvm'>
            <emulator>/usr/bin/kvm</emulator>
            <machine>pc-1.0-qemu-kvm</machine>
            <machine canonical='pc-1.0-qemu-kvm'>pc-1.0-precise</machine>
            <machine canonical='pc-1.0'>pc</machine>
            <machine>pc-1.0</machine>
            <machine>pc-0.14</machine>
            <machine>pc-0.13</machine>
            <machine>pc-0.12</machine>
            <machine>pc-0.11</machine>
            <machine>pc-0.10</machine>
            <machine>isapc</machine>
          </domain>
        </arch>
        <features>
          <cpuselection/>
          <deviceboot/>
          <pae/>
          <nonpae/>
          <acpi default='on' toggle='yes'/>
          <apic default='on' toggle='no'/>
        </features>
      </guest>
    
      <guest>
        <os_type>hvm</os_type>
        <arch name='x86_64'>
          <wordsize>64</wordsize>
          <emulator>/usr/bin/qemu-system-x86_64</emulator>
          <machine>pc-1.0-qemu-kvm</machine>
          <machine canonical='pc-1.0-qemu-kvm'>pc-1.0-precise</machine>
          <machine canonical='pc-1.0'>pc</machine>
          <machine>pc-1.0</machine>
          <machine>pc-0.14</machine>
          <machine>pc-0.13</machine>
          <machine>pc-0.12</machine>
          <machine>pc-0.11</machine>
          <machine>pc-0.10</machine>
          <machine>isapc</machine>
          <domain type='qemu'>
          </domain>
          <domain type='kvm'>
            <emulator>/usr/bin/kvm</emulator>
            <machine>pc-1.0-qemu-kvm</machine>
            <machine canonical='pc-1.0-qemu-kvm'>pc-1.0-precise</machine>
            <machine canonical='pc-1.0'>pc</machine>
            <machine>pc-1.0</machine>
            <machine>pc-0.14</machine>
            <machine>pc-0.13</machine>
            <machine>pc-0.12</machine>
            <machine>pc-0.11</machine>
            <machine>pc-0.10</machine>
            <machine>isapc</machine>
          </domain>
        </arch>
        <features>
          <cpuselection/>
          <deviceboot/>
          <acpi default='on' toggle='yes'/>
          <apic default='on' toggle='no'/>
        </features>
      </guest>
    
    </capabilities>

如果返回信息中看到```<domain type=''>```只有```qemu```，可能是BIOS中没有打开cpu的虚拟化。如果打开了硬件虚拟化，则在domain中可以看到kvm，如上面信息。

## 创建硬盘镜像

如下命令行，其中```--virt-type```参数的值由上述命令中的domain得到的。具体参照```man virt-install```。

比如```--virt-type qemu```，如下方演示。

再比如```--virt-type kvm```。

 xp

```-o preallocation=metadata```是优化参数

```cache=none```是优化参数，另外还可以添加bus=virtio，但是我添加这个参数之后安装xp的时候提示找不到硬盘。

    $ cd ~/vm
    $ sudo qemu-img create -f qcow2 -o preallocation=metadata xpsp3.qcow2.img 10G
    Formatting 'xpsp3.qcow2.img', fmt=qcow2 size=10737418240 encryption=off cluster_size=65536
    $ sudo virt-install --connect qemu:///system --virt-type kvm --name xpsp3 --ram 512 \
    --cdrom=/public/www/share/Tool/OS/xp/windowsxp-sp3.iso \
    --disk path=~/vm/xpsp3.qcow2.img,size=10,format=qcow2,cache=none \
    --network bridge=virbr0 \
    --graphics vnc,listen=0.0.0.0 --noautoconsole \
    --os-type=windows --os-variant=winxp

 win7 x64

    $ sudo qemu-img create -f qcow2 win7x64sp1.qcow2.img 100G
    $ sudo virt-install --connect qemu:///system --virt-type kvm --name win7x64sp1 --ram 4096 --cpu host\
    --cdrom=/public/www/share/Tool/OS/windows/cn_windows_7_ultimate_with_sp1_x64_dvd_u_677408.iso \
    --disk path=/home/chenyang/vm/win7x64sp1.qcow2.img,size=100,format=qcow2 \
    --network bridge=virbr0 \
    --graphics vnc,listen=0.0.0.0 --noautoconsole \
    --os-type=windows --os-variant=win7

win7 x86

    $ sudo qemu-img create -f qcow2 win7x86.qcow2.img 100G
    $ sudo virt-install --connect qemu:///system --virt-type kvm --name win7x86 --ram 4096 --cpu host\
    --cdrom=/public/www/share/Tool/OS/windows/cn_windows_7_ultimate_x86_dvd_x15-65907.iso \
    --disk path=/home/chenyang/vm/win7x86.qcow2.img,size=100,format=qcow2 \
    --network bridge=virbr0\
    --graphics vnc,listen=0.0.0.0 --noautoconsole \
    --os-type=windows --os-variant=win7
    
## 优化参数

- ```--cpu host``` 将host上的cpu所有特性都支持到virtual cpu上。

## 删除domain

用于调试

    $ sudo virsh destroy spbackupart1
    $ sudo virsh undefine spbackupart1

## 已经生成的vm

配置文件在/etc/libvirt/qemu

通过如下命令进行编辑

    $ sudo virsh edit spbackupart1

## 复制一份

    $ sudo virt-clone --connect=qemu:///system -o xpsp3 -n spbackupart1 -f /home/chenyang/vm/spbackupart1.qcow2.img
    Cloning xpsp3.qcow2.img                                  |  10 GB     00:41

    Clone 'spbackupart1' created successfully.

## 启动vm/关闭/重启

    $ sudo virsh start spbackupart1
    $ sudo virsh shutdown spbackupart1
    $ sudo virsh reboot spbackupart1

## 查看所有vm

    $ sudo virsh list --all
     Id Name                 State
    ----------------------------------
     10 win7x64sp1           running
      - spbackupart1         shut off
      - xpsp3                shut off

## 查看打开的vnc端口

    $ sudo virsh vncdisplay win7x64sp1

## 显示支持的os类型 ```--os-variant```

    $ sudo virt-install --os-variant list

## 性能问题

io性能的优化，看这里[http://itscblog.tamu.edu/improve-disk-io-performance-in-kvm/](http://itscblog.tamu.edu/improve-disk-io-performance-in-kvm/)

## 常见错误

1. 旧版kvm不认识一些参数

    ERROR    Unknown argument 'vnc'

解决办法：

使用```--vnc```取代```--graphics vnc```

2. 使用传统方法（小马，刷BIOS的SLIC）没办法激活win7

需要host先安装win7，然后用小马刷一下BIOS，然后才会有SLIC：```/sys/firmware/acpi/tables/SLIC``文件。

- [http://patrickshansyd.blogspot.com/2012/07/using-kvm-install-windows7-guest-system.html](http://patrickshansyd.blogspot.com/2012/07/using-kvm-install-windows7-guest-system.html)
- [http://blog.sina.com.cn/s/blog_802ca1fd0101c3yi.html](http://blog.sina.com.cn/s/blog_802ca1fd0101c3yi.html)

~~下载SLIC Toolkit，在一个已经激活的win7中运行，导出SLIC，比如```DELLWN09_V2.1.bin```

~~或者直接下载[SLIC 2.1 BINS 1-31-2011.7z](http://rghost.net/25221821)

## 参照

- [https://www.howtoforge.com/installing-kvm-guests-with-virt-install-on-ubuntu-12.04-lts-server](https://www.howtoforge.com/installing-kvm-guests-with-virt-install-on-ubuntu-12.04-lts-server)
- [http://docs.openstack.org/image-guide/content/virt-install.html](http://docs.openstack.org/image-guide/content/virt-install.html)
- [http://en.wikibooks.org/wiki/QEMU/Images](http://en.wikibooks.org/wiki/QEMU/Images)
- [http://wiki.libvirt.org/page/UbuntuKVMWalkthrough](http://wiki.libvirt.org/page/UbuntuKVMWalkthrough)
