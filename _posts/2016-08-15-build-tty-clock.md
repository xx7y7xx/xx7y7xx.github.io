---
layout: post
title:  "Build ncurse project"
date:   2016-08-15 19:16:00 +0800
categories: ncurse
---

```
chenyang@PC:~/source$ git clone https://github.com/xorg62/tty-clock.git
Cloning into 'tty-clock'...
remote: Counting objects: 445, done.
remote: Total 445 (delta 0), reused 0 (delta 0), pack-reused 445
Receiving objects: 100% (445/445), 96.21 KiB | 0 bytes/s, done.
Resolving deltas: 100% (218/218), done.
Checking connectivity... done.
```

```
chenyang@PC:~/source$ cd tty-clock/
chenyang@PC:~/source/tty-clock$ ll
total 56
drwxrwxr-x  3 chenyang chenyang  4096 Aug 15 19:13 ./
drwxrwxr-x 13 chenyang chenyang  4096 Aug 15 19:13 ../
drwxrwxr-x  8 chenyang chenyang  4096 Aug 15 19:13 .git/
-rw-rw-r--  1 chenyang chenyang    26 Aug 15 19:13 .gitignore
-rw-rw-r--  1 chenyang chenyang  1371 Aug 15 19:13 Makefile
-rw-rw-r--  1 chenyang chenyang  1379 Aug 15 19:13 README
-rw-rw-r--  1 chenyang chenyang  3232 Aug 15 19:13 tty-clock.1
-rw-rw-r--  1 chenyang chenyang 20471 Aug 15 19:13 ttyclock.c
-rw-rw-r--  1 chenyang chenyang  4183 Aug 15 19:13 ttyclock.h
```

```
chenyang@PC:~/source/tty-clock$ make
build ttyclock.c
CC   ttyclock.c
In file included from ttyclock.c:33:0:
ttyclock.h:44:21: fatal error: ncurses.h: No such file or directory
compilation terminated.
Makefile:22: recipe for target 'tty-clock' failed
make: *** [tty-clock] Error 1
```

```
chenyang@PC:~/source/tty-clock$ sudo apt-get install libncurses5-dev
[sudo] password for chenyang: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages were automatically installed and are no longer required:
  linux-headers-4.4.0-21 linux-headers-4.4.0-21-generic linux-image-4.4.0-21-generic linux-image-extra-4.4.0-21-generic
Use 'sudo apt autoremove' to remove them.
The following additional packages will be installed:
  libtinfo-dev
Suggested packages:
  ncurses-doc
The following NEW packages will be installed:
  libncurses5-dev libtinfo-dev
0 upgraded, 2 newly installed, 0 to remove and 103 not upgraded.
Need to get 252 kB of archives.
After this operation, 1,461 kB of additional disk space will be used.
Do you want to continue? [Y/n] 
Get:1 http://cn.archive.ubuntu.com/ubuntu xenial/main amd64 libtinfo-dev amd64 6.0+20160213-1ubuntu1 [77.4 kB]
Get:2 http://cn.archive.ubuntu.com/ubuntu xenial/main amd64 libncurses5-dev amd64 6.0+20160213-1ubuntu1 [175 kB]
Fetched 252 kB in 20s (12.4 kB/s)        
Selecting previously unselected package libtinfo-dev:amd64.
(Reading database ... 259161 files and directories currently installed.)
Preparing to unpack .../libtinfo-dev_6.0+20160213-1ubuntu1_amd64.deb ...
Unpacking libtinfo-dev:amd64 (6.0+20160213-1ubuntu1) ...
Selecting previously unselected package libncurses5-dev:amd64.
Preparing to unpack .../libncurses5-dev_6.0+20160213-1ubuntu1_amd64.deb ...
Unpacking libncurses5-dev:amd64 (6.0+20160213-1ubuntu1) ...
Processing triggers for man-db (2.7.5-1) ...
Setting up libtinfo-dev:amd64 (6.0+20160213-1ubuntu1) ...
Setting up libncurses5-dev:amd64 (6.0+20160213-1ubuntu1) ...
```

```
chenyang@PC:~/source/tty-clock$ make
build ttyclock.c
/bin/sh: 1: ncursesw5-config: not found
CC -Wall -g -I /usr/include -L   ttyclock.c
/bin/sh: 1: ncursesw5-config: not found
cc: error: missing argument to ‘-L’
Makefile:22: recipe for target 'tty-clock' failed
make: *** [tty-clock] Error 1
```

```
chenyang@PC:~/source/tty-clock$ ncursesw5-config
The program 'ncursesw5-config' is currently not installed. You can install it by typing:
sudo apt install libncursesw5-dev
```

```
chenyang@PC:~/source/tty-clock$ make
build ttyclock.c
CC -Wall -g -I /usr/include -L  -lncursesw -ltinfo ttyclock.c
/tmp/ccSAYNaL.o: In function `init':
/home/chenyang/source/tty-clock/ttyclock.c:49: undefined reference to `newterm'
/home/chenyang/source/tty-clock/ttyclock.c:51: undefined reference to `set_term'
/home/chenyang/source/tty-clock/ttyclock.c:53: undefined reference to `initscr'
/home/chenyang/source/tty-clock/ttyclock.c:56: undefined reference to `noecho'
/home/chenyang/source/tty-clock/ttyclock.c:58: undefined reference to `start_color'
/home/chenyang/source/tty-clock/ttyclock.c:60: undefined reference to `wclear'
/home/chenyang/source/tty-clock/ttyclock.c:63: undefined reference to `use_default_colors'
/home/chenyang/source/tty-clock/ttyclock.c:67: undefined reference to `init_pair'
/home/chenyang/source/tty-clock/ttyclock.c:68: undefined reference to `init_pair'
/home/chenyang/source/tty-clock/ttyclock.c:69: undefined reference to `init_pair'
/home/chenyang/source/tty-clock/ttyclock.c:73: undefined reference to `wrefresh'
/home/chenyang/source/tty-clock/ttyclock.c:103: undefined reference to `newwin'
/home/chenyang/source/tty-clock/ttyclock.c:108: undefined reference to `wborder'
/home/chenyang/source/tty-clock/ttyclock.c:113: undefined reference to `wattr_on'
/home/chenyang/source/tty-clock/ttyclock.c:117: undefined reference to `newwin'
/home/chenyang/source/tty-clock/ttyclock.c:122: undefined reference to `wborder'
/home/chenyang/source/tty-clock/ttyclock.c:124: undefined reference to `clearok'
/home/chenyang/source/tty-clock/ttyclock.c:132: undefined reference to `wrefresh'
/home/chenyang/source/tty-clock/ttyclock.c:135: undefined reference to `wrefresh'
/tmp/ccSAYNaL.o: In function `signal_handler':
/home/chenyang/source/tty-clock/ttyclock.c:146: undefined reference to `endwin'
/home/chenyang/source/tty-clock/ttyclock.c:156: undefined reference to `endwin'
/tmp/ccSAYNaL.o: In function `cleanup':
/home/chenyang/source/tty-clock/ttyclock.c:169: undefined reference to `delscreen'
/tmp/ccSAYNaL.o: In function `draw_number':
/home/chenyang/source/tty-clock/ttyclock.c:238: undefined reference to `wattr_on'
/home/chenyang/source/tty-clock/ttyclock.c:240: undefined reference to `wattr_off'
/home/chenyang/source/tty-clock/ttyclock.c:242: undefined reference to `wbkgdset'
/home/chenyang/source/tty-clock/ttyclock.c:243: undefined reference to `wmove'
/home/chenyang/source/tty-clock/ttyclock.c:243: undefined reference to `waddch'
/home/chenyang/source/tty-clock/ttyclock.c:245: undefined reference to `wrefresh'
/tmp/ccSAYNaL.o: In function `draw_clock':
/home/chenyang/source/tty-clock/ttyclock.c:261: undefined reference to `wbkgdset'
/home/chenyang/source/tty-clock/ttyclock.c:262: undefined reference to `wmove'
/home/chenyang/source/tty-clock/ttyclock.c:262: undefined reference to `waddnstr'
/home/chenyang/source/tty-clock/ttyclock.c:263: undefined reference to `wmove'
/home/chenyang/source/tty-clock/ttyclock.c:263: undefined reference to `waddnstr'
/home/chenyang/source/tty-clock/ttyclock.c:271: undefined reference to `wattr_on'
/home/chenyang/source/tty-clock/ttyclock.c:273: undefined reference to `wattr_off'
/home/chenyang/source/tty-clock/ttyclock.c:277: undefined reference to `wbkgdset'
/home/chenyang/source/tty-clock/ttyclock.c:278: undefined reference to `mvwprintw'
/home/chenyang/source/tty-clock/ttyclock.c:279: undefined reference to `wrefresh'
/home/chenyang/source/tty-clock/ttyclock.c:286: undefined reference to `wbkgdset'
/home/chenyang/source/tty-clock/ttyclock.c:287: undefined reference to `wmove'
/home/chenyang/source/tty-clock/ttyclock.c:287: undefined reference to `waddnstr'
/home/chenyang/source/tty-clock/ttyclock.c:288: undefined reference to `wmove'
/home/chenyang/source/tty-clock/ttyclock.c:288: undefined reference to `waddnstr'
/tmp/ccSAYNaL.o: In function `clock_move':
/home/chenyang/source/tty-clock/ttyclock.c:303: undefined reference to `wbkgdset'
/home/chenyang/source/tty-clock/ttyclock.c:304: undefined reference to `wborder'
/home/chenyang/source/tty-clock/ttyclock.c:305: undefined reference to `werase'
/home/chenyang/source/tty-clock/ttyclock.c:306: undefined reference to `wrefresh'
/home/chenyang/source/tty-clock/ttyclock.c:310: undefined reference to `wbkgdset'
/home/chenyang/source/tty-clock/ttyclock.c:311: undefined reference to `wborder'
/home/chenyang/source/tty-clock/ttyclock.c:312: undefined reference to `werase'
/home/chenyang/source/tty-clock/ttyclock.c:313: undefined reference to `wrefresh'
/home/chenyang/source/tty-clock/ttyclock.c:317: undefined reference to `mvwin'
/home/chenyang/source/tty-clock/ttyclock.c:318: undefined reference to `wresize'
/home/chenyang/source/tty-clock/ttyclock.c:323: undefined reference to `mvwin'
/home/chenyang/source/tty-clock/ttyclock.c:326: undefined reference to `wresize'
/home/chenyang/source/tty-clock/ttyclock.c:329: undefined reference to `wborder'
/home/chenyang/source/tty-clock/ttyclock.c:335: undefined reference to `wborder'
/home/chenyang/source/tty-clock/ttyclock.c:338: undefined reference to `wrefresh'
/home/chenyang/source/tty-clock/ttyclock.c:339: undefined reference to `wrefresh'
/tmp/ccSAYNaL.o: In function `set_box':
/home/chenyang/source/tty-clock/ttyclock.c:403: undefined reference to `wbkgdset'
/home/chenyang/source/tty-clock/ttyclock.c:404: undefined reference to `wbkgdset'
/home/chenyang/source/tty-clock/ttyclock.c:407: undefined reference to `wbkgdset'
/home/chenyang/source/tty-clock/ttyclock.c:408: undefined reference to `wbkgdset'
/home/chenyang/source/tty-clock/ttyclock.c:409: undefined reference to `wborder'
/home/chenyang/source/tty-clock/ttyclock.c:410: undefined reference to `wborder'
/home/chenyang/source/tty-clock/ttyclock.c:413: undefined reference to `wborder'
/home/chenyang/source/tty-clock/ttyclock.c:414: undefined reference to `wborder'
/home/chenyang/source/tty-clock/ttyclock.c:417: undefined reference to `wrefresh'
/home/chenyang/source/tty-clock/ttyclock.c:418: undefined reference to `wrefresh'
/tmp/ccSAYNaL.o: In function `key_event':
/home/chenyang/source/tty-clock/ttyclock.c:430: undefined reference to `wgetch'
/home/chenyang/source/tty-clock/ttyclock.c:442: undefined reference to `init_pair'
/home/chenyang/source/tty-clock/ttyclock.c:443: undefined reference to `init_pair'
/home/chenyang/source/tty-clock/ttyclock.c:450: undefined reference to `wgetch'
/home/chenyang/source/tty-clock/ttyclock.c:531: undefined reference to `init_pair'
/home/chenyang/source/tty-clock/ttyclock.c:532: undefined reference to `init_pair'
/tmp/ccSAYNaL.o: In function `main':
/home/chenyang/source/tty-clock/ttyclock.c:669: undefined reference to `wattr_on'
/home/chenyang/source/tty-clock/ttyclock.c:678: undefined reference to `endwin'
collect2: error: ld returned 1 exit status
Makefile:22: recipe for target 'tty-clock' failed
make: *** [tty-clock] Error 1
```

```
chenyang@PC:~/source/tty-clock$ ncurses5-config --libdir
chenyang@PC:~/source/tty-clock$ 
```

`libncurses5-dev` is ncurses5

`ncursesw5-config` is ncursesw5

```
chenyang@PC:~/source/tty-clock$ locate ncurses
/lib/x86_64-linux-gnu/libncurses.so.5
/lib/x86_64-linux-gnu/libncurses.so.5.9
/lib/x86_64-linux-gnu/libncursesw.so.5
/lib/x86_64-linux-gnu/libncursesw.so.5.9
/usr/lib/vlc/plugins/gui/libncurses_plugin.so
/usr/share/doc/libncurses5
/usr/share/doc/libncursesw5
/usr/share/doc/ncurses-base
/usr/share/doc/ncurses-bin
/usr/share/doc/ncurses-term
/usr/share/doc/ncurses-base/changelog.Debian.gz
/usr/share/doc/ncurses-base/copyright
/usr/share/doc/ncurses-bin/FAQ
/usr/share/doc/ncurses-bin/changelog.Debian.gz
/usr/share/doc/ncurses-bin/copyright
/usr/share/doc/ncurses-term/changelog.Debian.gz
/usr/share/doc/ncurses-term/copyright
/usr/share/lintian/overrides/ncurses-base
/var/lib/dpkg/info/libncurses5:amd64.list
/var/lib/dpkg/info/libncurses5:amd64.md5sums
/var/lib/dpkg/info/libncurses5:amd64.shlibs
/var/lib/dpkg/info/libncurses5:amd64.symbols
/var/lib/dpkg/info/libncurses5:amd64.triggers
/var/lib/dpkg/info/libncursesw5:amd64.list
/var/lib/dpkg/info/libncursesw5:amd64.md5sums
/var/lib/dpkg/info/libncursesw5:amd64.shlibs
/var/lib/dpkg/info/libncursesw5:amd64.symbols
/var/lib/dpkg/info/libncursesw5:amd64.triggers
/var/lib/dpkg/info/ncurses-base.conffiles
/var/lib/dpkg/info/ncurses-base.list
/var/lib/dpkg/info/ncurses-base.md5sums
/var/lib/dpkg/info/ncurses-bin.list
/var/lib/dpkg/info/ncurses-bin.md5sums
/var/lib/dpkg/info/ncurses-term.list
/var/lib/dpkg/info/ncurses-term.md5sums
```

```diff
--- /tmp/qkAQBv_Makefile
+++ /home/chenyang/source/tty-clock/Makefile
@@ -11,7 +11,7 @@
 
 ifeq ($(shell sh -c 'which ncurses5-config>/dev/null 2>/dev/null && echo y'), y)
 	CFLAGS ?= -Wall -g -I $$(ncurses5-config --includedir)
-	LDFLAGS ?= -L $$(ncurses5-config --libdir) $$(ncursesw5-config --libs)
+	LDFLAGS ?= -L /lib/x86_64-linux-gnu/ $$(ncurses5-config --libdir) $$(ncursesw5-config --libs)
 else ifeq ($(shell sh -c 'which ncursesw5-config>/dev/null 2>/dev/null && echo y'), y)
 		CFLAGS ?= -Wall -g -I $$(ncursesw5-config --includedir)
 		LDFLAGS ?= -L $$(ncursesw5-config --libdir) $$(ncursesw5-config --libs)
```

```
chenyang@PC:~/source/tty-clock$ make
build ttyclock.c
CC -Wall -g -I /usr/include -L /lib/x86_64-linux-gnu/  -lncursesw -ltinfo ttyclock.c
```

```
chenyang@PC:~/source/tty-clock$ ./tty-clock 
```

## ref

- http://www.cyberciti.biz/faq/linux-error-cursesh-no-such-file-directory/
- [ncurses vs ncursesw](https://github.com/openwrt/packages/issues/526#issuecomment-62326114)