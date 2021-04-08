---
title: Crystal Space 3D
layout: page
---

## My enviroment

- GT 440
- Ubuntu 14.04

## Compile under Ubuntu

### Checkout the code of version 2.0 stable

    svn checkout svn://svn.code.sf.net/p/crystal/code/CS/tags/V2.0 CS_V2.0

Not wait a long time, go to prepare external libraries.

### Preparing external libraries

Install lib from repo.

    $ sudo apt-get install build-essential autoconf libtool pkg-config jam subversion swig doxygen bison flex libcppunit-dev libx11-dev mesa-common-dev libxaw7-dev libgl1-mesa-dev libxext-dev libxxf86vm-dev libxrender-dev nvidia-current-dev nvidia-cg-toolkit zlib1g-dev libfreetype6-dev libjpeg-dev libmng-dev libpng12-dev liblcms-dev libcairo-dev libcairomm-1.0-dev libgtk2.0-dev libwxbase2.8-dev libwxgtk2.8-dev libasound-dev libopenal-dev libogg-dev libvorbis-dev libspeex-dev python-dev libode-dev lib3ds-dev libcal3d-dev

This is the output of my enviroment.

    [sudo] password for chenyang: 
    Reading package lists... Done
    Building dependency tree       
    Reading state information... Done
    Note, selecting 'liblcms1-dev' instead of 'liblcms-dev'
    Note, selecting 'libcairo2-dev' instead of 'libcairo-dev'
    Note, selecting 'libasound2-dev' instead of 'libasound-dev'
    Note, selecting 'libcal3d12-dev' instead of 'libcal3d-dev'
    build-essential is already the newest version.
    build-essential set to manually installed.
    doxygen is already the newest version.
    libx11-dev is already the newest version.
    libx11-dev set to manually installed.
    pkg-config is already the newest version.
    zlib1g-dev is already the newest version.
    zlib1g-dev set to manually installed.
    subversion is already the newest version.
    The following package was automatically installed and is no longer required:
      linux-image-generic
    Use 'apt-get autoremove' to remove it.
    The following extra packages will be installed:
      automake autotools-dev debhelper dh-apparmor freeglut3 gir1.2-gtk-2.0
      lib3ds-1-3 libatk1.0-dev libbison-dev libcairo-script-interpreter2
      libcal3d12 libcg libcggl libcppunit-1.13-0 libcuda1-304 libdrm-dev
      libexpat1-dev libfl-dev libfontconfig1-dev libgdk-pixbuf2.0-dev
      libglib2.0-dev libharfbuzz-dev libharfbuzz-gobject0 libjpeg-turbo8-dev
      libjpeg8-dev liblcms1 liblcms2-dev libltdl-dev libmail-sendmail-perl libode1
      libpango1.0-dev libpcre3-dev libpcrecpp0 libpixman-1-dev libpython-dev
      libpython2.7-dev libsigc++-2.0-dev libsigsegv2 libsys-hostname-long-perl
      libwxbase3.0-0 libx11-xcb-dev libxcb-dri2-0-dev libxcb-dri3-dev
      libxcb-glx0-dev libxcb-present-dev libxcb-randr0-dev libxcb-render0-dev
      libxcb-shape0-dev libxcb-shm0-dev libxcb-sync-dev libxcb-xfixes0-dev
      libxcomposite-dev libxcursor-dev libxdamage-dev libxfixes-dev libxft-dev
      libxi-dev libxinerama-dev libxml2-utils libxmu-dev libxmu-headers libxpm-dev
      libxrandr-dev libxshmfence-dev m4 nvidia-304 nvidia-304-dev nvidia-cg-dev
      nvidia-libopencl1-304 nvidia-opencl-icd-304 po-debconf python2.7-dev swig2.0
      wx-common wx2.8-headers x11proto-composite-dev x11proto-damage-dev
      x11proto-dri2-dev x11proto-fixes-dev x11proto-gl-dev x11proto-randr-dev
      x11proto-render-dev x11proto-xext-dev x11proto-xf86vidmode-dev
      x11proto-xinerama-dev
    Suggested packages:
      autoconf2.13 autoconf-archive gnu-standards autoconf-doc bison-doc dh-make
      apparmor-easyprof libasound2-doc libcairo2-doc libcairomm-1.0-doc
      libcppunit-doc libglib2.0-doc libgtk2.0-doc liblcms-utils libtool-doc
      libpango1.0-doc libsigc++-2.0-doc automaken gfortran fortran95-compiler
      gcj-jdk wx2.8-doc xlibmesa-glu-dev libglu-dev libxaw-doc libxext-doc
      nvidia-cg-doc libmail-box-perl swig-doc swig-examples swig2.0-examples
      swig2.0-doc
    The following packages will be REMOVED:
      libcuda1-331 nvidia-331 nvidia-331-uvm nvidia-libopencl1-331
      nvidia-opencl-icd-331
    The following NEW packages will be installed:
      autoconf automake autotools-dev bison debhelper dh-apparmor flex freeglut3
      gir1.2-gtk-2.0 jam lib3ds-1-3 lib3ds-dev libasound2-dev libatk1.0-dev
      libbison-dev libcairo-script-interpreter2 libcairo2-dev libcairomm-1.0-dev
      libcal3d12 libcal3d12-dev libcg libcggl libcppunit-1.13-0 libcppunit-dev
      libcuda1-304 libdrm-dev libexpat1-dev libfl-dev libfontconfig1-dev
      libfreetype6-dev libgdk-pixbuf2.0-dev libgl1-mesa-dev libglib2.0-dev
      libgtk2.0-dev libharfbuzz-dev libharfbuzz-gobject0 libjpeg-dev
      libjpeg-turbo8-dev libjpeg8-dev liblcms1 liblcms1-dev liblcms2-dev
      libltdl-dev libmail-sendmail-perl libmng-dev libode-dev libode1 libogg-dev
      libopenal-dev libpango1.0-dev libpcre3-dev libpcrecpp0 libpixman-1-dev
      libpng12-dev libpython-dev libpython2.7-dev libsigc++-2.0-dev libsigsegv2
      libspeex-dev libsys-hostname-long-perl libtool libvorbis-dev
      libwxbase2.8-dev libwxbase3.0-0 libwxgtk2.8-dev libx11-xcb-dev libxaw7-dev
      libxcb-dri2-0-dev libxcb-dri3-dev libxcb-glx0-dev libxcb-present-dev
      libxcb-randr0-dev libxcb-render0-dev libxcb-shape0-dev libxcb-shm0-dev
      libxcb-sync-dev libxcb-xfixes0-dev libxcomposite-dev libxcursor-dev
      libxdamage-dev libxext-dev libxfixes-dev libxft-dev libxi-dev
      libxinerama-dev libxml2-utils libxmu-dev libxmu-headers libxpm-dev
      libxrandr-dev libxrender-dev libxshmfence-dev libxxf86vm-dev m4
      mesa-common-dev nvidia-304 nvidia-304-dev nvidia-cg-dev nvidia-cg-toolkit
      nvidia-current-dev nvidia-libopencl1-304 nvidia-opencl-icd-304 po-debconf
      python-dev python2.7-dev swig swig2.0 wx-common wx2.8-headers
      x11proto-composite-dev x11proto-damage-dev x11proto-dri2-dev
      x11proto-fixes-dev x11proto-gl-dev x11proto-randr-dev x11proto-render-dev
      x11proto-xext-dev x11proto-xf86vidmode-dev x11proto-xinerama-dev
    0 upgraded, 119 newly installed, 5 to remove and 23 not upgraded.
    Need to get 99.7 MB of archives.
    After this operation, 145 MB of additional disk space will be used.
    Do you want to continue? [Y/n] 

## Compile

    ./configure
    jam

Some error info

    ...failed C++ ./out/linux/optimize/plugins/video/render3d/shader/shadercompiler/xmlshader/cpi/docwrap.o ...
    C++ ./out/linux/optimize/plugins/video/render3d/shader/shadercompiler/xmlshader/plugin_impl.o 
    ...skipped xmlshader.so for lack of <plugins!video!render3d!shader!shadercompiler!xmlshader!>forcedprioshader.o...

At last show this info

    MkDir1 ./out/linux/optimize/plugins/video/render3d/null 
    C++ ./out/linux/optimize/plugins/video/render3d/null/null_render3d.o 
    C++ ./out/linux/optimize/plugins/video/render3d/null/null_txt.o 
    C++ ./out/linux/optimize/plugins/video/render3d/null/null_pix.o 
    C++ ./out/linux/optimize/plugins/video/render3d/null/plugin_impl.o 
    ...skipped null3d.so for lack of crystalspace...
    MkDir1 ./out/linux/optimize/plugins/video/cursor 
    C++ ./out/linux/optimize/plugins/video/cursor/cursor.o 
    C++ ./out/linux/optimize/plugins/video/cursor/plugin_impl.o 
    ...skipped cscursor.so for lack of crystalspace...
    ...failed updating 65 target(s)...
    ...skipped 208 target(s)...
    ...updated 1154 target(s)...

All files after compiling

    total 2808
    drwxrwxr-x 12 chenyang chenyang    4096 Apr  4 17:16 ./
    drwxrwxr-x 24 chenyang chenyang    4096 Apr  4 16:35 ../
    drwxrwxr-x  8 chenyang chenyang    4096 Jul  2  2012 apps/
    drwxrwxr-x  2 chenyang chenyang    4096 Jul  2  2012 bin/
    -rw-rw-r--  1 chenyang chenyang  299229 Apr  4 16:36 config.log
    -rwxrwxr-x  1 chenyang chenyang   43897 Apr  4 16:36 config.status*
    -rwxrwxr-x  1 chenyang chenyang 2237119 Jul  2  2012 configure*
    -rw-rw-r--  1 chenyang chenyang  114795 Jul  2  2012 configure.ac
    -rwxrwxr-x  1 chenyang chenyang    2057 Apr  4 16:48 cs-config*
    -rwxr-xr-x  1 chenyang chenyang   12281 Apr  4 16:48 cs-config-2.0*
    drwxrwxr-x 57 chenyang chenyang    4096 Jul  2  2012 data/
    drwxrwxr-x  7 chenyang chenyang    4096 Jul  2  2012 docs/
    drwxrwxr-x 18 chenyang chenyang    4096 Apr  4 16:36 include/
    -rw-rw-r--  1 chenyang chenyang    2185 Jul  2  2012 INSTALL
    -rw-rw-r--  1 chenyang chenyang    8073 Apr  4 16:36 Jamconfig
    -rw-rw-r--  1 chenyang chenyang    3642 Apr  4 16:36 Jamfile
    -rw-rw-r--  1 chenyang chenyang    3631 Jul  2  2012 Jamfile.in
    -rw-rw-r--  1 chenyang chenyang    2899 Jul  2  2012 Jamrules
    lrwxrwxrwx  1 chenyang chenyang      49 Apr  4 16:40 libcrystalspace-2.0.dbg -> ./out/linux/optimize/libs/libcrystalspace-2.0.dbg
    lrwxrwxrwx  1 chenyang chenyang      56 Apr  4 16:41 libcrystalspace_opengl-2.0.dbg -> ./out/linux/optimize/libs/libcrystalspace_opengl-2.0.dbg
    drwxrwxr-x  7 chenyang chenyang    4096 Jul  2  2012 libs/
    -rw-rw-r--  1 chenyang chenyang   26430 Jul  2  2012 LICENSE
    -rw-rw-r--  1 chenyang chenyang   35640 Apr  4 16:36 Makefile
    drwxrwxr-x 10 chenyang chenyang    4096 Jul  2  2012 mk/
    drwxrwxr-x  3 chenyang chenyang    4096 Apr  4 16:38 out/
    drwxrwxr-x 29 chenyang chenyang    4096 Jul  2  2012 plugins/
    -rw-rw-r--  1 chenyang chenyang    2135 Jul  2  2012 README
    drwxrwxr-x 14 chenyang chenyang    4096 Jul  2  2012 scripts/
    -rw-rw-r--  1 chenyang chenyang    4530 Jul  2  2012 vfs.cfg
