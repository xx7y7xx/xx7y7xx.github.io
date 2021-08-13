---
layout: post
title: 'China is in the "Google Maps Platform Prohibited Territories" list'
---

My website [https://photo-map.github.io/](https://photo-map.github.io/) has something wrong with loading Google Map. On the webpage it says: "This page can't load Google Maps correctly."

In the Dev Console, there is an error message: "You have exceeded your request quota for this API. See https://developers.google.com/maps/documentation/javascript/error-messages?utm_source=maps_js&utm_medium=degraded&utm_campaign=billing#api-key-and-billing-errors"

After checking the quota setting of Google Maps Platform (https://console.cloud.google.com/google/maps-apis/quotas?project=***), I found the "Map loads per day" field is set to only 1. And when I try to update this field, the tips said: "Enter a number between 0 and 1."

Then I try to create a Support Case for this issue.

They anwser me this is because China is on the list of "Google Maps Platform Prohibited Territories" ([https://cloud.google.com/maps-platform/terms/maps-prohibited-territories/](https://cloud.google.com/maps-platform/terms/maps-prohibited-territories/))

Currently the list is:

```
Prohibited Territories:

China

Crimea

Cuba

Iran

North Korea

Syria

Vietnam
```
