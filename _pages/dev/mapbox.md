---
layout: page
title: Mapbox
permalink: /dev/mapbox.html
---

## what is bearing

![](/attachments/mapbox-bearing.jpg)

Rotation, Direction, Heading or Bearing? [https://github.com/mapbox/mapbox-gl-native/issues/3688](https://github.com/mapbox/mapbox-gl-native/issues/3688)

## images on map

https://docs.mapbox.com/mapbox-gl-js/example/image-on-a-map/

```
map.on('load', () => {
  map.addSource('radar', {
    'type': 'image',
    'url': 'https://google.com/dog.jpg',
    'coordinates': [
      // 1-2
      // | |
      // 4-3
      [101,1],[114,1],[114,16],[101,16]
    ]
  })
  map.addLayer({
    id: 'radar-layer',
    'type': 'raster',
    'source': 'radar',
    'paint': {
      'raster-fade-duration': 0
    }
  })
})
```

## Mapbox expression playground

* https://observablehq.com/@mourner/mapbox-gl-expression-playground
