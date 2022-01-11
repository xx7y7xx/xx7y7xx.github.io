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
