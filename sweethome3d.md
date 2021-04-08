---
layout: page
title: SweetHome3D
---

## sh3d格式

zip格式，使用7-Zip直接解压即可。或者将`test.sh3d`改成`test.sh3d.zip`双击即可解压。

文件内部结构：

<pre>
test.sh3d.extract
|-- 0 : 模型预览图，Home.xml > home > pieceOfFurniture > icon
|-- 1 : 模型文件夹，调用者 Home.xml > home > pieceOfFurniture
|-- 2 : 模型预览图，Home.xml > home > pieceOfFurniture > icon
|-- 3 : 模型文件夹，调用者 Home.xml > home > pieceOfFurniture
|-- 4 : 贴图文件，Home.xml > home > room > texture.id
|-- 5 : 贴图文件，Home.xml > home > wall > texture.id
|-- ContentDigests
|-- Home : 
`-- Home.xml : 场景（索引）文件
</pre>

`Home.xml`是所有图片/模型文件的索引，类似于Web开发中的`index.html`。内容示例：

```xml
<?xml version='1.0'?>
<home version='5300' name='b.sh3d' camera='observerCamera' wallHeight='250.0'>
  <property name='com.eteks.sweethome3d.SweetHome3D.CatalogPaneDividerLocation' value='418'/>
  <property name='com.eteks.sweethome3d.SweetHome3D.FrameHeight' value='832'/>
  <property name='com.eteks.sweethome3d.SweetHome3D.FrameMaximized' value='true'/>
  <property name='com.eteks.sweethome3d.SweetHome3D.FrameWidth' value='1120'/>
  <property name='com.eteks.sweethome3d.SweetHome3D.FrameX' value='100'/>
  <property name='com.eteks.sweethome3d.SweetHome3D.FrameY' value='100'/>
  <property name='com.eteks.sweethome3d.SweetHome3D.FurnitureViewportY' value='0'/>
  <property name='com.eteks.sweethome3d.SweetHome3D.MainPaneDividerLocation' value='604'/>
  <property name='com.eteks.sweethome3d.SweetHome3D.PlanPaneDividerLocation' value='350'/>
  <property name='com.eteks.sweethome3d.SweetHome3D.PlanViewportX' value='0'/>
  <property name='com.eteks.sweethome3d.SweetHome3D.PlanViewportY' value='0'/>
  <property name='com.eteks.sweethome3d.SweetHome3D.ScreenHeight' value='1040'/>
  <property name='com.eteks.sweethome3d.SweetHome3D.ScreenWidth' value='1920'/>
  <property name='com.eteks.sweethome3d.swing.PhotoPanel.PhotoDialogX' value='125'/>
  <property name='com.eteks.sweethome3d.swing.PhotoPanel.PhotoDialogY' value='125'/>
  <furnitureVisibleProperty name='NAME'/>
  <furnitureVisibleProperty name='WIDTH'/>
  <furnitureVisibleProperty name='DEPTH'/>
  <furnitureVisibleProperty name='HEIGHT'/>
  <furnitureVisibleProperty name='VISIBLE'/>
  <environment groundColor='00A8A8A8' skyColor='00CCE4FC' lightColor='00D0D0D0' ceillingLightColor='00D0D0D0' photoWidth='5000' photoHeight='2500' photoAspectRatio='RATIO_2_1' photoQuality='2' videoWidth='320' videoAspectRatio='RATIO_4_3' videoQuality='0' videoFrameRate='25'/>
  <compass x='-100.0' y='50.0' diameter='100.0' northDirection='0.0' longitude='2.11898' latitude='0.5411393' timeZone='Asia/Shanghai'/>
  <observerCamera attribute='observerCamera' lens='SPHERICAL' x='853.84436' y='404.82455' z='170.0' yaw='8.647786' pitch='0.4413496' fieldOfView='1.0995575' time='1479902400578'/>
  <camera attribute='topCamera' lens='PINHOLE' x='823.49994' y='1393.5592' z='1125.0' yaw='3.1415927' pitch='0.7853982' fieldOfView='1.0995575' time='1479902400577'/>
  <pieceOfFurniture catalogId='Blend Swap CC-BY#childChair' name='Child chair' creator='Radio hate' model='1/childChair.obj' icon='0' x='992.6' y='519.3092' width='38.2' depth='39.5' height='67.0' dropOnTopElevation='0.48507464'/>
  <pieceOfFurniture catalogId='Scopia#clothes_washing_machine' name='Clothes washing machine' creator='Scopia' model='3/clothes_washing_machine.obj' icon='2' x='635.0' y='259.6092' width='59.0' depth='60.100002' height='84.200005'/>
  <wall id='wall0' wallAtEnd='wall1' xStart='439.5' yStart='95.55922' xEnd='439.5' yEnd='691.5592' height='250.0' thickness='7.5' pattern='hatchUp'>
    <texture attribute='leftSideTexture' name='绿浪壁纸' catalogId='eTeksScopia#green_waves_wallpaper' width='100.0' height='100.0' image='5'/>
    <baseboard attribute='leftSideBaseboard' thickness='1.0' height='7.0'/>
  </wall>
  <wall id='wall1' wallAtStart='wall0' wallAtEnd='wall2' xStart='439.5' yStart='691.5592' xEnd='1207.5' yEnd='691.5592' height='250.0' thickness='7.5' pattern='hatchUp'>
    <texture attribute='leftSideTexture' name='绿浪壁纸' catalogId='eTeksScopia#green_waves_wallpaper' width='100.0' height='100.0' image='5'/>
    <baseboard attribute='leftSideBaseboard' thickness='1.0' height='7.0'/>
  </wall>
  <wall id='wall2' wallAtStart='wall1' wallAtEnd='wall3' xStart='1207.5' yStart='691.5592' xEnd='1207.5' yEnd='95.55922' height='250.0' thickness='7.5' pattern='hatchUp'>
    <texture attribute='leftSideTexture' name='绿浪壁纸' catalogId='eTeksScopia#green_waves_wallpaper' width='100.0' height='100.0' image='5'/>
    <baseboard attribute='leftSideBaseboard' thickness='1.0' height='7.0'/>
  </wall>
  <wall id='wall3' wallAtStart='wall2' xStart='1207.5' yStart='95.55922' xEnd='439.5' yEnd='95.55915' height='250.0' thickness='7.5' pattern='hatchUp'>
    <texture attribute='leftSideTexture' name='绿浪壁纸' catalogId='eTeksScopia#green_waves_wallpaper' width='100.0' height='100.0' image='5'/>
    <baseboard attribute='leftSideBaseboard' thickness='1.0' height='7.0'/>
  </wall>
  <room areaVisible='true' ceilingColor='FFE7FFE2'>
    <texture attribute='floorTexture' name='淡米色英语拼花地板' catalogId='eTeksScopia#light-beige-parquet' width='100.0' height='100.0' image='4'/>
    <point x='443.25' y='99.30915'/>
    <point x='1203.75' y='99.30922'/>
    <point x='1203.75' y='687.8092'/>
    <point x='443.25' y='687.8092'/>
  </room>
</home>
```

`Home.xml`内容格式，请参照源码中的`com.eteks.sweethome3d.io.HomeXMLExporter`类。

### 家具模型 `<pieceOfFurniture>`

父节点： `<home>`

属性：

* `icon` - 用于在SweetHome3D左侧模型列表中显示的模型预览图
* `x`, `y` - 平面摆放坐标
* `width`, `depth`, `height` - 家具的宽度/深度/高度
* `model` - 家具对应的3D模型文件

### 墙体 `<wall>`

父节点： `<home>`

子节点： `<texture>`, `<baseboad>`

### 贴图 `<texture>`

父节点： `<wall>`, `<room>`

属性：

* `image` - 贴图文件