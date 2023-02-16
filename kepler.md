An example of Kepler map config JSON: https://github.com/uber-web/kepler.gl-data/blob/master/earthquakes/config.json

## Kepler builtin components

### SidePanel - SidePanelFactory

Show the left side panel

TODO - snapshot here

Source code: https://github.com/keplergl/kepler.gl/blob/v1.1.11/src/components/side-panel.js

## Left side panel

By setting `readOnly` as `false`, we could show left side panel.

```js
this.props.addDataToMap({
  options: {
    readOnly: false
  }
})
```

## Layers

### Arc layer colors base on value of another

```js
const arcLayer = layers.find(layer => layer.type === 'arc')
this.props.layerVisualChannelConfigChange(arcLayer, {
  colorField: {
    name: 'apple_size',
    type: 'integer'
  },
  colorScale: 'quantize'
})
```

### Show H3 layer

The name should be something like "hex_id", if name is "h3_hash", it will not show as H3 layer automatically.

```js
fields: [
  { name: 'hex_id', format: '', type: 'string' }
```

### Show or hide layers

```
import * as actions from 'kepler.gl/actions';
const layer = rootState.keplerGl.mapId.visState.layers[0]
this.props.dispatch(
  actions.layerConfigChange(layer, {
    isVisible: true,
  }),
);
```

## Map

### Zoom to a bbox

```js
import * as turf from '@turf/turf'
import { fitBounds } from 'kepler.gl/actions'
const bbox = turf.bbox(turf.point([longitude, latitude])) // [103.785, 1.435, 103.785, 1.435]
this.props.dispatch(fitBounds(bbox))
```

### Load new data and keep current map state

https://github.com/uber-common/vis-academy/blob/kepler.gl/src/demos/kepler.gl/3-load-config/src/app.js

http://vis.academy/#/kepler.gl/3-load-config

https://github.com/keplergl/kepler.gl/issues/176

```js
class App extends React.Component {
  // This method is used as reference to show how to export the current kepler.gl instance configuration
  // Once exported the configuration can be imported using parseSavedConfig or load method from KeplerGlSchema
  getMapConfig = () => {
    // retrieve kepler.gl store
    const { keplerGl } = this.props
    // retrieve current kepler.gl instance store
    const { [this.props.id]: map } = keplerGl

    // create the config object
    return KeplerGlSchema.getConfigToSave(map)
  }
  
  updateMap = () => {
    // read the current configuration
    const config = this.getMapConfig() // config.version="v1", config.config.mapState={...}
    
    this.props.addDataToMap({
      datasets: {
        info: {
          label: 'Test Data',
          id: 'test_data'
        },
        data: {
          fields: [
            { name: 'id', format: '', type: 'string' }
          ],
          rows: [['123'], ['456']]
        }
      },
      options: {
        centerMap: false, // Set to false, otherwise map to fitBounds (zoom to data bbox) automatically after data loaded.
        readOnly: false
      },
      config
    })
  }
}
```

## why kepler.gl lock to a specific deck.gl version?

See thisi PR: https://github.com/keplergl/kepler.gl/pull/1602 ([Bug] lock deck.gl to 8.2.0 #1602) )

## Load data from URL

https://kepler.gl/demo?mapUrl=https://gist.githubusercontent.com/xx7y7xx/50d7d888e01471ae9ec978a3057c9ddc/raw/aa0b132c76b8bb7bc592ccbdbfdca96ee61800f0/a.csv

## Add new filter

```js
import { useDispatch } from 'react-redux'
import * as actions from 'kepler.gl/actions'
const dispatch = useDispatch()
dispatch(actions.addFilter('data_id'))
dispatch(actions.setFilter(4, 'name', 'column_name'))
dispatch(actions.setFilter(4, 'value', ['foo', 'bar']))
```

## Init a new project

```
$ npx create-react-app keplergl-demo --template redux
$ npm i kepler.gl styled-components assert
```

Modify webpack config

```
    resolve: {
      fallback: {
        assert: require.resolve('assert'),
        url: false,
        querystring: false
      }
```

Start kepler.gl

```
$ rm -rf node_modules/kepler.gl/node_modules/react-redux ; npm start
```

Note: This is to fix react-redux conflict error: Uncaught Error: Could not find "store" in the context of "Connect(Container)".

## Field definitions

```json
{
  datasets: {},
  config: {
    visState: {
      filters: [
        {
          id: 'students_count',
          dataId: 'students_count',
          name: 'Students Count',
          type: 'range',
          enlarged: false,
          value: [0, 100],
        }
      ],
      layers: []
    }
  }
}
```

```
// src/constants/default-settings.js
export const ALL_FIELD_TYPES = keyMirror({
  boolean: null,
  date: null,
  geojson: null,
  integer: null,
  real: null,
  string: null,
  timestamp: null,
  point: null
});
```

## Get mapbox from kepler.gl

```jsx
<KeplerGl
  getMapboxRef={mapRef => {
    mapbox = mapRef?.getMap()
    // List all mapbox layers in kepler.gl
    console.log('All mapbox layers:', mapbox.getStyle().layers)
  }}
/>
```

## Get deckgl from kepler.gl

```jsx
<KeplerGl
  onDeckInitialized={(deck /*Deck*/, gl /*WebGL2RenderingContext*/) => {
    // List all deck.gl layers in kepler.gl
    console.log('All deck.gl layers', deck.layerManager.layers);
  }}
/>
```

## Examples

* GeoJSON - https://kepler.gl/demo?mapUrl=https://gist.githubusercontent.com/xx7y7xx/2c26754503984878b5c8c184055a4e63/raw/44e5bac4110a45fdd5b6e3ee007a240bc7d8466a/kepler-gl-geojson.csv
