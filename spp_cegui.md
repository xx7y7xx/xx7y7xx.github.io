---
layout: page
title: SPP CEGUI
---

## 为button添加url属性，方便在按钮上记录点击按钮时候跳转的url

1. 修改```general.looknfeel```文件

{% highlight xml %}
<WidgetLook name="General/Button">
    <PropertyDefinition name="url" initialValue="" redrawOnWrite="true"/>
    [...]
{% endhighlight %}

2. 在layout中定义一个按钮

{% highlight xml %}
<Window Type="General/Button" Name="building/window/open" >
    <Property Name="text_theme" Value="打开网址" />
    <Property Name="url" Value="" />
    [...]
{% endhighlight %}

3. 使用脚本设置属性

{% highlight javascript %}
var button = FUNCTION_DATA.get_windows("building/window/open");
button.SetProperty("url", "http://google.com");
{% endhighlight %}

4. 使用脚本获取属性

{% highlight javascript %}
var button = FUNCTION_DATA.get_windows("building/window/open");
var url = button.GetProperty("url");
{% endhighlight %}