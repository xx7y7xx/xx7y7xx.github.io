---
layout: post
title: Can not mount raspbeery pi micro SD card on macOS
---

There is a "timeout waiting for hardware interrupt" message when starting the rpi, so I decide to backup the data on this micro SD card, and re-install new OS.

First I want to mount this card on macOS

```
$ brew cask install osxfuse
Updating Homebrew...
^C==> Caveats
To install and/or use osxfuse you may need to enable their kernel extension in

  System Preferences → Security & Privacy → General

For more information refer to vendor documentation or the Apple Technical Note:

  https://developer.apple.com/library/content/technotes/tn2459/_index.html

You must reboot for the installation of osxfuse to take effect.

==> Satisfying dependencies
==> Downloading https://github.com/osxfuse/osxfuse/releases/download/osxfuse-3.8.2/osxfu
==> Downloading from https://github-production-release-asset-2e65be.s3.amazonaws.com/186
######################################################################## 100.0%
==> Verifying SHA-256 checksum for Cask 'osxfuse'.
==> Installing Cask osxfuse
==> Running installer for osxfuse; your password may be necessary.
==> Package installers may write to any location; options such as --appdir are ignored.
Password:
installer: Package name is FUSE for macOS
installer: choices changes file '/var/folders/zr/g5x9y2w542d_f3hyf9k41bqr0000gn/T/choices20181002-11927-rgqtch.xml' applied
installer: Installing at base path /
installer: The install was successful.
==> Changing ownership of paths required by osxfuse; your password may be necessary
🍺  osxfuse was successfully installed!
```

It stucked in "Updating Homebrew..." for a long time, so I decided to ignore the updating by pressing Ctrl+C

```
$ brew install ext4fuse
Updating Homebrew...
^C==> Downloading https://homebrew.bintray.com/bottles/ext4fuse-0.1.3.high_sierra.bottle.t
######################################################################## 100.0%
==> Pouring ext4fuse-0.1.3.high_sierra.bottle.tar.gz
🍺  /usr/local/Cellar/ext4fuse/0.1.3: 5 files, 50.9KB
```

Also need Ctrl+C to ignore the updating.

Find out the disk ID

```
 ~  diskutil list
/dev/disk0 (internal, physical):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:      GUID_partition_scheme                        *251.0 GB   disk0
   1:                        EFI EFI                     209.7 MB   disk0s1
   2:                 Apple_APFS Container disk1         250.8 GB   disk0s2

/dev/disk1 (synthesized):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:      APFS Container Scheme -                      +250.8 GB   disk1
                                 Physical Store disk0s2
   1:                APFS Volume Macintosh HD            219.2 GB   disk1s1
   2:                APFS Volume Preboot                 21.0 MB    disk1s2
   3:                APFS Volume Recovery                519.0 MB   disk1s3
   4:                APFS Volume VM                      8.6 GB     disk1s4

/dev/disk2 (external, physical):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:     FDisk_partition_scheme                        *15.7 GB    disk2
   1:             Windows_FAT_32 boot                    58.7 MB    disk2s1
   2:                      Linux                         15.7 GB    disk2s2
```

Try to mount `disk2s2`, but failed

```
 ~  sudo mkdir /Volumes/rpi
Password:
 ~  sudo ext4fuse /dev/disk2s2 /Volumes/rpi -o allow_other
Assertion failed: ((size_t)pread_ret == size), function __disk_read, file disk.c, line 110.
[1]    13127 abort      sudo ext4fuse /dev/disk2s2 /Volumes/rpi -o allow_other
 ✘  ~ 
```