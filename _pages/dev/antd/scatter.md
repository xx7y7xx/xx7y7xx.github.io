---
layout: page
title: ant design plots Scatter
permalink: /dev/antd/scatter.html
---

```jsx
import { Scatter } from '@ant-design/plots'; // ^1.2.3
<Scatter
  size={[0, 30]}
  legend={false}
  onReady={(plot) => {
    // plot.chart.tooltip
    
    // Disable animation in scatter chart
    // * https://charts.ant.design/en/docs/api/common-graph/common-graph#animate
    // * https://antv.gitbook.io/f2/api/chart/animation#chart.animate-false
    plot.chart.animate(false);
  }}
/>
```

## Turn off the chart animation

```jsx
import { Scatter } from '@ant-design/plots'; // ^1.2.3
<Scatter
  onReady={(plot) => {
    // https://charts.ant.design/en/docs/api/common-graph/common-graph#animate
    //plot.chart.animate(false); // NOT WORKING
  }}

  // https://antv.gitbook.io/f2/api/chart/animation#chart.animate-false
  //animate={false} // NOT WORKING
  
  animation={false} // WORKING
/>
```

## Examples

* https://codesandbox.io/s/issue-2001-b255j?file=/index.ts
* Simple - https://codesandbox.io/s/antv-scatter-fqx3kl
* Bubble chart with view-zoom - https://codesandbox.io/s/antv-scatter-view-zoom-4idgi1

