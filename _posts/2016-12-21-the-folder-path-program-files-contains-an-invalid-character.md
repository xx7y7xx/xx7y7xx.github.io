---
layout: post
title: 文件夹路径 Program Files 中含有无效的字符 (The folder path 'Program Files' contains an invalid character)
---

在使用iTunes的时候遇到了“文件夹路径 Program Files 中含有无效的字符” (The folder path 'Program Files' contains an invalid character)错误，如下提供了解决方案。

## 现象

安装iTunes时候报错：

```
文件夹路径 Program Files 中含有无效的字符。
```

以下截图是网上找的，当时出错的时候忘记截图了。

![文件夹路径 Program Files 中含有无效的字符。](/attachments/9d82d158ccbf6c8151abcf97bf3eb13533fa4035.jpg)

安装程序没有终止，继续安装直到结束。

使用iTunes貌似没有什么问题，但是在使用iTools的时候会报错。

## 分析

使用7-Zip打开`itunes6464setup.exe`，包含了如下几个文件。

```
AppleApplicationSupport.msi
AppleApplicationSupport64.msi
AppleMobileDeviceSupport6464.msi
AppleSoftwareUpdate.msi
Bonjour64.msi
iTunes6464.msi
SetupAdmin.exe
```

检查已经安装好的程序，发现只有`Bonjour64.msi`没有安装上，并且没有`Bonjour`服务。

使用7-Zip将`itunes6464setup.exe`中的`Bonjour64.msi`文件解压出来，单独运行，仍然报错“文件夹路径 Program Files 中含有无效的字符”

这时候安装`Bonjour64.msi`，显示错误

出现上述错误的时候，刚好电脑上插着USB光驱，并且自动将D盘符分配给了USB光驱。

检查临时目录中的安装日志`%TEMP%\MSI3ed4d.LOG`内容：

```
错误 1324。文件夹路径 Program Files 中含有无效的字符。
=== 记录停止: 2016/12/21  21:16:39 ===
```

拔掉USB光驱，D盘没有了，再次安装`Bonjour64.msi`，显示错误

```
无效驱动器: D:\
```

检查临时目录中的安装日志`%TEMP%\MSI8f76c.LOG`内容：

```
错误 1327。无效驱动器: D:\
=== 记录停止: 2016/12/21  23:02:18 ===
```

我的电脑中之前有C、D、E三个分区，后来把D盘删除了（安装Ubuntu），只保留了C和E盘。

这时候基本确定是D盘缺失导致的，如果光驱占据D盘时候仍然出错，那么估计就是需要往D盘写文件。

所以插入一个U盘，自动分配了D盘符。

再次安装`Bonjour64.msi`，没有任何错误，安装成功。

去检查D盘内容，D盘根目录多了一个`Program Files`文件夹，就是刚才报错的信息，进入文件夹只发现了`D:\Program Files\java\jre7\lib\ext\dns_sd.jar`这一个文件。

![文件夹路径 Program Files 中含有无效的字符。](/attachments/screenshot_20161221_230701.jpg)

联想到很有之前D盘还在的时候，确实把JDK安装到了D盘，后来删除D盘的时候估计是忘记卸载了吧，留下了这个隐患。

网上还有另外一个同样的错误信息，仍然是JDK相关的错误：[https://discussions.apple.com/thread/646681?start=0&tstart=0](https://discussions.apple.com/thread/646681?start=0&tstart=0)（最下面的回复中解决了问题）

## 解决方案

总不能一直插着U盘使用吧

由于上面已经将`Bonjour64.msi`安装成功了，所以第一步是卸载Bonjour

然后卸载Java 7 / JDK 7。卸载时候可能会报错（因为之前删除分区时候没有卸载），比如

![Windows Installer: 无法访问您试图使用的功能所在的网络位置](/attachments/screenshot_20161222_004452.jpg)

这时候就需要`MicrosoftProgram_Install_and_Uninstall.meta.diagcab`来解决Windows Installer的卸载问题了。下载地址：[Fix problems that block programs from being installed or removed](https://support.microsoft.com/en-us/help/17588/fix-problems-that-block-programs-from-being-installed-or-removed)

卸载完之后，再次安装Bonjour，仍然会往`D:\Program Files\java\jre7\lib\ext\dns_sd.jar`写文件。

然后再次卸载。

看来可能是`Java_Home`环境变量在作怪，所以删除掉/更新环境变量。

然后在注册表中搜索“`D:\Program Files\java\jre7`”并删除相应节点。

找到如下节点，但是只需要删除前三个就行，其他几个不太相关。

```
HKEY_LOCAL_MACHINE\SOFTWARE\JavaSoft\Java Runtime Environment\1.7
HKEY_LOCAL_MACHINE\SOFTWARE\JavaSoft\Java Runtime Environment\1.7.0
HKEY_LOCAL_MACHINE\SOFTWARE\JavaSoft\Java Runtime Environment\1.7.0\MSI
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Active Setup\Installed Components\{08B0E5C0-4FCB-11CF-AAA5-00401C608500}
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\Low Rights\ElevationPolicy\{3B9A6E32-36C9-4946-B78C-3F58E3785EC1}
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\0357E4991DA5FF14F9615B6314070F00
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Installer\UserData\S-1-5-18\Components\0357E4991DA5FF14F9615B6514070F00
```

最后尝试安装，发现`dns_sd.jar`安装到了`C:\Program Files (x86)\Bonjour\dns_sd.jar`和`C:\Program Files\Java\jre1.8.0_111\lib\ext\dns_sd.jar`这两个地方。（别问我怎么知道安装到这些地方的，我安装卸载Bonjour的次数比你吃过的盐都多 :') ）

另外，`dns_sd.jar`文件创建时间是“2015年8月12日，16:03:38”，以便参考。

最后的最后，将U盘卸载了，然后将Bonjour先卸载，然后再安装，没有报错。