---
layout: page
title: Geohash
---

## 优点

- 可以保护隐私（只表示大概区域位置而不是具体的点）
- 比较容易做缓存，比如某个区域内的用户不断发送位置信息请求餐馆数据，由于这些用户的GeoHash字符串都是`WX4ER`，所以可以把`WX4ER`当作key，把该区域的餐馆信息当作value来进行缓存，而如果不使用GeoHash的话，由于区域内的用户传来的经纬度是各不相同的，很难做缓存。

## 缺点

- 由于GeoHash是将区域划分为一个个规则矩形，并对每个矩形进行编码，这样在查询附近POI信息时会导致以下问题，比如红色的点是我们的位置，绿色的两个点分别是附近的两个餐馆，但是在查询的时候会发现距离较远餐馆的GeoHash编码与我们一样（因为在同一个GeoHash区域块上），而较近餐馆的GeoHash编码与我们不一致。这个问题往往产生在边界处。

## References

- [http://www.cnblogs.com/LBSer/p/3310455.html](http://www.cnblogs.com/LBSer/p/3310455.html)
- 查询geohash地图 [http://mapzen.github.io/leaflet-spatial-prefix-tree/](http://mapzen.github.io/leaflet-spatial-prefix-tree/)