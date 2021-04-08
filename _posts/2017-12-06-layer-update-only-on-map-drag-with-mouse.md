---
layout: post
title: "deck.gl - Layer update only on map drag with mouse"
---

## cause

### input props mutated

```js
const data = [];
const layer = <DeckGL data={data} />
data.push({ id: '123' });
// layer not rerender
```

Refs: [https://github.com/uber/deck.gl/issues/724](https://github.com/uber/deck.gl/issues/724)