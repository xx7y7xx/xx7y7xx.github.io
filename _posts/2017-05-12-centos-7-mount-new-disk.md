---
layout: post
title: CentOS 7 mount new harddisk
---

list disks

```
[root@yzb-centos-08 chenyang]# fdisk -l

Disk /dev/vda: 32.2 GB, 32212254720 bytes, 62914560 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk label type: dos
Disk identifier: 0x0009680e

   Device Boot      Start         End      Blocks   Id  System
/dev/vda1            2048     4194303     2096128   82  Linux swap / Solaris
/dev/vda2   *     4194304    56623103    26214400   83  Linux

Disk /dev/vdb: 107.4 GB, 107374182400 bytes, 209715200 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
```

Use `fdisk` tool

```
[root@yzb-centos-08 chenyang]# fdisk /dev/vdb 
Welcome to fdisk (util-linux 2.23.2).

Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.

Device does not contain a recognized partition table
Building a new DOS disklabel with disk identifier 0xb1da6155.
```

print partitions

```
Command (m for help): p

Disk /dev/vdb: 107.4 GB, 107374182400 bytes, 209715200 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk label type: dos
Disk identifier: 0xb1da6155

   Device Boot      Start         End      Blocks   Id  System
```

create partitions

```
Command (m for help): n
Partition type:
   p   primary (0 primary, 0 extended, 4 free)
   e   extended
Select (default p): p
Partition number (1-4, default 1): 1
First sector (2048-209715199, default 2048): 
Using default value 2048
Last sector, +sectors or +size{K,M,G} (2048-209715199, default 209715199): 
Using default value 209715199
Partition 1 of type Linux and of size 100 GiB is set
```

write to disk

```
Command (m for help): w
The partition table has been altered!

Calling ioctl() to re-read partition table.
Syncing disks.
```

check new partitions

```
[root@yzb-centos-08 chenyang]# fdisk -l /dev/vdb

Disk /dev/vdb: 107.4 GB, 107374182400 bytes, 209715200 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk label type: dos
Disk identifier: 0xb1da6155

   Device Boot      Start         End      Blocks   Id  System
/dev/vdb1            2048   209715199   104856576   83  Linux
[root@yzb-centos-08 chenyang]# mkfs
mkfs         mkfs.btrfs   mkfs.cramfs  mkfs.ext2    mkfs.ext3    mkfs.ext4    mkfs.minix   mkfs.xfs     
```

formatting disk

```
[root@yzb-centos-08 chenyang]# mkfs.xfs /dev/vdb1
meta-data=/dev/vdb1              isize=256    agcount=4, agsize=6553536 blks
         =                       sectsz=512   attr=2, projid32bit=1
         =                       crc=0        finobt=0
data     =                       bsize=4096   blocks=26214144, imaxpct=25
         =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0 ftype=0
log      =internal log           bsize=4096   blocks=12799, version=2
         =                       sectsz=512   sunit=0 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0
```

check partition filesystem type

```
[root@yzb-centos-08 chenyang]# df -T
Filesystem     Type     1K-blocks    Used Available Use% Mounted on
/dev/vda2      ext4      25671908 1908864  22435940   8% /
devtmpfs       devtmpfs   3996328       0   3996328   0% /dev
tmpfs          tmpfs      4005452       0   4005452   0% /dev/shm
tmpfs          tmpfs      4005452   16720   3988732   1% /run
tmpfs          tmpfs      4005452       0   4005452   0% /sys/fs/cgroup
tmpfs          tmpfs       801092       0    801092   0% /run/user/0
tmpfs          tmpfs       801092       0    801092   0% /run/user/1000
[root@yzb-centos-08 chenyang]# df -hT
Filesystem     Type      Size  Used Avail Use% Mounted on
/dev/vda2      ext4       25G  1.9G   22G   8% /
devtmpfs       devtmpfs  3.9G     0  3.9G   0% /dev
tmpfs          tmpfs     3.9G     0  3.9G   0% /dev/shm
tmpfs          tmpfs     3.9G   17M  3.9G   1% /run
tmpfs          tmpfs     3.9G     0  3.9G   0% /sys/fs/cgroup
tmpfs          tmpfs     783M     0  783M   0% /run/user/0
tmpfs          tmpfs     783M     0  783M   0% /run/user/1000
```

## References

- [http://software-engineer.gatsbylee.com/how-to-format-and-partition-disk-on-centos-7/](http://software-engineer.gatsbylee.com/how-to-format-and-partition-disk-on-centos-7/)