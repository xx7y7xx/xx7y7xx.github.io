---
layout: page
title: Google Drive API
permalink: /dev/google-api/google-drive-api.html
---

## Summary

All these are for v3 API.

## How to make a request

```js
window.gapi.client
  .request({
    path: "https://www.googleapis.com/drive/v3/files",
    params: {
      q: "name = 'IMG_0000.JPG'",
      fields: "files/imageMediaMetadata/location,files/thumbnailLink",
    },
  })
  .execute((resp) => {
    console.log("This is Files.list response:", resp);
  });
```

## Files.list

This is the basic API references: [https://developers.google.com/drive/api/v3/reference/files/list#request](https://developers.google.com/drive/api/v3/reference/files/list#request)

### How to query files in Google Drive

Use the "q" param. How to use "q" param: [https://developers.google.com/drive/api/v3/search-files](https://developers.google.com/drive/api/v3/search-files)

```js
window.gapi.client
  .request({
    path: "https://www.googleapis.com/drive/v3/files",
    params: {
      q: "name = 'IMG_0000.JPG'",
      fields: "files/imageMediaMetadata/location,files/thumbnailLink",
    },
  })
  .execute((resp) => {});
```

### Find only folders

Ref: [https://stackoverflow.com/a/33225632/4685522](https://stackoverflow.com/a/33225632/4685522)

```json
{
  "q": "mimeType='application/vnd.google-apps.folder' and name='Photo Map'"
}
```

Here is a sample response, "id" is "Folder ID".

```json
{
  "files": [
    {
      "kind": "drive#file",
      "id": "1Kv...MF",
      "name": "Photo Map",
      "mimeType": "application/vnd.google-apps.folder"
    }
  ]
}
```

### Find all files in one folder

Ref: [https://stackoverflow.com/a/24720185/4685522](https://stackoverflow.com/a/24720185/4685522)

`1Kv...vMF` is "Folder ID", could find it in above chapter "Find only folders".

```json
{
  "q": "'1Kv...vMF' in parents"
}
```

### How to filter out the fields in response

#### Description

Add "fields" in the request params.
The value of this param must prefix with "files/".

#### Multiple filters

```json
{
  "fields": "files/imageMediaMetadata/location,files/thumbnailLink"
}
```

#### Get photo location

Ref: [https://stackoverflow.com/a/54397863/4685522](https://stackoverflow.com/a/54397863/4685522)

```json
{
  "fields": "files/imageMediaMetadata"
}
```

Get location in response.

```json
{
  "imageMediaMetadata": {
    "location": {
      "latitude": 1,
      "longitude": 103,
      "altitude": 456
    }
  }
}
```

#### Get thumbnail

Ref: [https://stackoverflow.com/a/45027853/4685522](https://stackoverflow.com/a/45027853/4685522)

```json
{
  "fields": "files/thumbnailLink"
}
```

Get location in response.

```json
{
  "thumbnailLink": "https://lh3.googleusercontent.com/4tM...220"
}
```

#### Full fields of the "Files" resource

The full fields in the response is too much for simple use.
Here is one response with full "Files" fields:

```json
{
  "kind": "drive#file",
  "id": "1JW...OvV",
  "name": "IMG_0000.JPG",
  "mimeType": "image/jpeg",
  "starred": false,
  "trashed": false,
  "explicitlyTrashed": false,
  "parents": ["1Kv...MF"],
  "spaces": ["drive"],
  "version": "2",
  "webContentLink": "https://drive.google.com/uc?id=1JW...OvV&export=download",
  "webViewLink": "https://drive.google.com/file/d/1JW...OvV/view?usp=drivesdk",
  "iconLink": "https://drive-thirdparty.googleusercontent.com/16/type/image/jpeg",
  "hasThumbnail": true,
  "thumbnailLink": "https://lh3.googleusercontent.com/4tM...220",
  "thumbnailVersion": "1",
  "viewedByMe": true,
  "viewedByMeTime": "2020-01-01T01:01:01.001Z",
  "createdTime": "2020-01-01T01:01:01.001Z",
  "modifiedTime": "2020-01-01T01:01:01.001Z",
  "modifiedByMeTime": "2020-01-01T01:01:01.001Z",
  "modifiedByMe": true,
  "owners": [
    {
      "kind": "drive#user",
      "displayName": "Foo Bar",
      "me": true,
      "permissionId": "177...768",
      "emailAddress": "foobar@gmail.com"
    }
  ],
  "lastModifyingUser": {
    "kind": "drive#user",
    "displayName": "Foo Bar",
    "me": true,
    "permissionId": "177...768",
    "emailAddress": "foobar@gmail.com"
  },
  "shared": false,
  "ownedByMe": true,
  "capabilities": {
    "canAddChildren": false,
    "canAddMyDriveParent": false,
    "canChangeCopyRequiresWriterPermission": true,
    "canChangeViewersCanCopyContent": true,
    "canComment": true,
    "canCopy": true,
    "canDelete": true,
    "canDownload": true,
    "canEdit": true,
    "canListChildren": false,
    "canModifyContent": true,
    "canMoveChildrenWithinDrive": false,
    "canMoveItemIntoTeamDrive": true,
    "canMoveItemOutOfDrive": true,
    "canMoveItemWithinDrive": true,
    "canReadRevisions": true,
    "canRemoveChildren": false,
    "canRemoveMyDriveParent": true,
    "canRename": true,
    "canShare": true,
    "canTrash": true,
    "canUntrash": true
  },
  "viewersCanCopyContent": true,
  "copyRequiresWriterPermission": false,
  "writersCanShare": true,
  "permissions": [
    {
      "kind": "drive#permission",
      "id": "177...768",
      "type": "user",
      "emailAddress": "foobar@gmail.com",
      "role": "owner",
      "displayName": "Foo Bar",
      "deleted": false
    }
  ],
  "permissionIds": ["177...768"],
  "originalFilename": "IMG_0000.JPG",
  "fullFileExtension": "JPG",
  "fileExtension": "JPG",
  "md5Checksum": "bff...54c",
  "size": "3013",
  "quotaBytesUsed": "3013",
  "headRevisionId": "0B9...RPQ",
  "imageMediaMetadata": {
    "width": 40,
    "height": 30,
    "rotation": 0,
    "location": {
      "latitude": 1,
      "longitude": 103,
      "altitude": 456
    },
    "time": "2020:01:01 01:01:01",
    "cameraMake": "Apple",
    "cameraModel": "iPhone 4",
    "exposureTime": 0.000458,
    "aperture": 1.8,
    "flashUsed": false,
    "focalLength": 4,
    "isoSpeed": 20,
    "meteringMode": "Pattern",
    "sensor": "One-chip color area",
    "exposureMode": "Auto",
    "whiteBalance": "Auto",
    "exposureBias": 0
  },
  "isAppAuthorized": false
}
```

Using "fields='files(\*)'" in the v3 API could get full fields.
Here is the document for all fields: [https://developers.google.com/drive/api/v3/reference/files#resource-representations](https://developers.google.com/drive/api/v3/reference/files#resource-representations)

## Playground

Open webpage [https://developers.google.com/drive/api/v3/reference/files/list](https://developers.google.com/drive/api/v3/reference/files/list), on the right side, there is a tool called "Try this API".
