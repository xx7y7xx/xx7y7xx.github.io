## When load new data

* modules/services/mapillary.js::loadNextTilePage() to load data from backend server
** dispatch.call('loadedImages')
* modules/svg/mapillary_images.js::drawImages() to render line on the map

## When drag on the map

* modules/renderer/map.js::redraw()
* modules/svg/layers.js::drawLayers()
* modules/svg/mapillary_images.js::drawImages()

## Public method for layers in modules/svg/*.js

* enabled()
* supported()

## Private method for layers in modules/svg/*.js

* editOn() - Show the markers
