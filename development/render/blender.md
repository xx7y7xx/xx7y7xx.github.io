---
layout: page
title: Blender
---

## render time comparison

http://xxd3vin.github.io/attachments/spreadsheets/d/1l2y2KktDDMAvYe7ZeFiUNEJLmyR0s9vZdYY3fAnkgEI/pubchart.html

## Do not create *.blend1 (blender backup file) when saving a blend file

{% highlight python %}
bpy.context.user_preferences.filepaths.save_version = 0
{% endhighlight %}

## Cycles

Limitations:

- CUDA limitations: 

## Render a Complex Scene using Render Layers

[http://www.blenderguru.com/articles/how-to-render-a-complex-scene-without-crashing/](http://www.blenderguru.com/articles/how-to-render-a-complex-scene-without-crashing/)