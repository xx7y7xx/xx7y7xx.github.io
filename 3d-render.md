---
layout: page
---

## crystalspace bugplug调试方法

[http://www.crystalspace3d.org/main/Bugplug_tutorial](http://www.crystalspace3d.org/main/Bugplug_tutorial)

    spp.exe -plugin=bugplug

进入场景之后，Ctrl+D会提示输出debug指令。

## blender cycles texture limit

as sayed in http://www.elysiun.com/forum/showthread.php?309902-Suggestion-for-workaround-for-cycles-texture-limit

CUDA limit texture count for 2.x is 128

That is : 95 LDR + 5 HDR + 28 internal use

3.x above is 256

That is : 223 LDR + 5 HDR + 28 internal use

The CUDA spec is here : http://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html#compute-capabilities

## 在双CPU的电脑上启动时候会崩溃掉

按照http://superuser.com/questions/124269/3d-studio-max-and-2cpus-core-limit 中的提示，原因在于mental ray的限制

> The problem is the mental ray limitations – if you want to lunch 3ds max in more than 16 threads you must remove metnalray.dlz

所以将`mentalray.dlz`改名成`mentalray.dlz.backup`就可以正常启动max了。
