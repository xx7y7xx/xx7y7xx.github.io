---
layout: page
title: SPP Template - School - UI
---

## 导航栏1 - 校园介绍

鼠标悬停在导航栏上时候的浮动文字
- [json/json.js](attachment/spp/json/json.js) : ui.schoolIntroduce.buttonText.chinese

### 校园介绍

tab页title

正文存储逻辑结构
- [json/json.js](https://github.com/xx7y7xx/spp-school-template/blob/master/target/json/json.js) : ui.schoolIntroduce.introduceText.chinese
  - [ui/ui_language.js](https://github.com/xx7y7xx/spp-school-template/blob/master/target/ui/ui_language.js) : LANGUAGE_CHINESE["about_school/content"]
    - 下面的找不到了。


UI定义：[ui/data/zhucaidan.layout](https://github.com/xx7y7xx/spp-school-template/blob/master/target/ui/data/zhucaidan.layout)

{% highlight xml %}
<Window Type="General/DefaultWindowBackground" Name="school_info/tab_window/about_school/window" >
    <Window Type="General/StaticText" Name="about_school/content" > <!-- dialog内的文本内容 -->
        <Window Type="General/Button" Name="about_school/window/open" > <!-- “更多信息”按钮 -->
            <Property Name="text_theme" Value="更多信息" />
{% endhighlight %}

“更多信息”按钮点击打开网页

{% highlight javascript %}
[...]
about_school_goto_url : function (){
    System.Open(URL.home_url);
},
[...]
"about_school/window/open" : {
    property : {},
    event : {
        "MouseClick":"about_school_goto_url"
    },
    subscribe :{}
},
[...]
{% endhighlight %}

### 分类查询

### 校园图片集

## 建筑信息

当走进某些建筑物，鼠标指向（悬停在）建筑物的时候，鼠标icon会显示一个可以点击的标志。鼠标点击后，弹出“建筑信息”dialog。

建筑信息dialog内容存储在[json/json.js](https://github.com/xx7y7xx/spp-school-template/blob/master/target/json/json.js)

{% highlight javascript %}
JSON_SCHOOL = {
[...]
    "ui": {
        "BULID_DATA": {
            "i31": {
                "chinese": {
                    "intro": "\n\
\n\
您好，这里是北京市八一中学的实验楼。", 
                    "name": "实验楼"
                }, 
                "english": {
                    "intro": "\n\
", 
                    "name": "shiyanlou"
                }, 
                "image": "/ui/data/image/bud2#1.jpg", 
                "meshobj": "bud2#1"
            },
[...]
{% endhighlight %}

## 建筑信息

UI定义：[ui/data/zhucaidan.layout](https://github.com/xx7y7xx/spp-school-template/blob/master/target/ui/data/zhucaidan.layout)

{% highlight xml %}
<Window Type="General/DefaultWindowBackground" Name="zhucaidan/building" >
    <Window Type="General/StaticImage" Name="building/logo_image" />
    <Window Type="General/Button" Name="building/close_button" />
    <Window Type="General/DefaultWindowBackground" Name="building/window" >
        <Window Type="General/StaticImage" Name="building/image" />
        <Window Type="General/StaticText" Name="building/content" />
    </Window>
</Window>
{% endhighlight %}
