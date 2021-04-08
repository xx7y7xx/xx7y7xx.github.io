---
layout: page
title: ThreeJS
---

## how to export model with material in blender using io_three addon

By default, threejs exporter for blender cant export material, cause these code in file ```io_three/constants.py```

{% highlight python %}
EXPORT_OPTIONS = {
# ...
    MATERIALS: False,
    FACE_MATERIALS: False,
    MAPS: False,
# ...
}
{% endhighlight %}

Change setting to ```True``` will solve this problem.

## boilerplate

- [https://github.com/fazeaction/webpack-threejs-boilerplate](https://github.com/fazeaction/webpack-threejs-boilerplate)
- [https://github.com/jeromeetienne/threejsboilerplate](https://github.com/jeromeetienne/threejsboilerplate)
