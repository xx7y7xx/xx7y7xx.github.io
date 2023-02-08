---
layout: page
title: ant design plots Scatter
permalink: /dev/amap/index.html
---

```jsx
import { Scatter } from '@ant-design/plots';
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

## Examples

* https://codesandbox.io/s/issue-2001-b255j?file=/index.ts
