---
layout: page
title: redux-observable
permalink: /dev/redux/redux-observable.html
---

## redux-observable Sequencing actions together

[https://github.com/redux-observable/redux-observable/issues/33](https://github.com/redux-observable/redux-observable/issues/33)

## Subscribe on Epic

[https://github.com/redux-observable/redux-observable/issues/90](https://github.com/redux-observable/redux-observable/issues/90)

## Process Manager dispatch multiple actions

[https://github.com/redux-observable/redux-observable/issues/62#issuecomment-230332833](https://github.com/redux-observable/redux-observable/issues/62#issuecomment-230332833)

When calling `del(1)`, these actions will be triggered: `DELETE -> DELETE_SUCCESS -> LOAD -> LOAD_SUCCESS`

```js
export function load() {
  return {
    type: LOAD,
  };
}

export function loadSuccess(response) {
  return {
    type: LOAD_SUCCESS,
    payload: {
      data: response.data,
    },
  };
}

export function loadFailure(error) {
  return {
    type: LOAD_FAILURE,
    error,
  };
}

export const loadDataEpic = (action$, store, { api }) =>
  action$
    .ofType(LOAD)
    .switchMap((action) => api.loadData())
    .map(loadSuccess)
    .catch((err, stream) =>
      Observable.merge(Observable.of(loadFailure(err)), stream)
    );

export function del(id) {
  return {
    type: DELETE,
    payload: {
      id,
    },
  };
}

export function deleteSuccess() {
  return {
    type: DELETE_SUCCESS,
  };
}

export function deleteFailure(error) {
  return {
    type: DELETE_FAILURE,
    error,
  };
}

// DELETE -> DELETE_SUCCESS -> LOAD -> LOAD_SUCCESS
export const deleteItemEpic = (action$, store, { api }) =>
  action$
    .ofType(DELETE)
    .switchMap((action) => api.deleteItem(action.payload.id))
    .flatMap((payload) =>
      // Concat 2 observables so they fire sequentially
      Observable.concat(Observable.of(deleteSuccess()), Observable.of(load()))
    )
    .catch((err, stream) =>
      Observable.merge(Observable.of(deleteFailure(err)), stream)
    );
```

## mergeMap vs flatMap vs concatMap vs switchMap

[https://tolikcode.github.io/post/rxjsMap/](https://tolikcode.github.io/post/rxjsMap/)

## unittest

[Unit testing](/dev/redux/redux-observable-unit-testing.html)

## wait for two actions complete

[https://stackoverflow.com/questions/45546401/wait-for-sequence-of-action-with-a-redux-observable](https://stackoverflow.com/questions/45546401/wait-for-sequence-of-action-with-a-redux-observable)
