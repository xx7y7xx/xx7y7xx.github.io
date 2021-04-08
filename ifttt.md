---
layout: page
title: ifttt
---

## Service

### RSS Feed

[https://ifttt.com/feed](https://ifttt.com/feed)

Ingredient

```
EntryTitle: v1.0
EntryUrl: https://ift.tt/2GYGClt
EntryAuthor: xxd3vin
EntryContent: No content.
EntryImageUrl: https://ift.tt/eA8V8J
EntryPublished: April 14, 2018 at 02:09PM
FeedTitle: Release notes from sandbox
FeedUrl: https://ift.tt/2qwc8Mo
```

## Visual Studio Code Release Notifier

Applet title: Visual Studio Code Release Notifier

### Trigger

Feed URL: https://github.com/Microsoft/vscode/releases.atom

The example content from the vscode feed URL:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<feed xmlns="http://www.w3.org/2005/Atom" xmlns:media="http://search.yahoo.com/mrss/" xml:lang="en-US">
  <id>tag:github.com,2008:https://github.com/Microsoft/vscode/releases</id>
  <link type="text/html" rel="alternate" href="https://github.com/Microsoft/vscode/releases"/>
  <link type="application/atom+xml" rel="self" href="https://github.com/Microsoft/vscode/releases.atom"/>
  <title>Release notes from vscode</title>
  <updated>2018-04-13T00:21:42+08:00</updated>
  <entry>
    <id>tag:github.com,2008:Repository/41881900/1.22.2</id>
    <updated>2018-04-13T00:21:42+08:00</updated>
    <link rel="alternate" type="text/html" href="https://github.com/Microsoft/vscode/releases/tag/1.22.2"/>
    <title>1.22.2</title>
    <content type="html">&lt;p&gt;update release number&lt;/p&gt;</content>
    <author>
      <name>kieferrm</name>
    </author>
    <media:thumbnail height="30" width="30" url="https://avatars3.githubusercontent.com/u/4674940?s=60&amp;v=4"/>
  </entry>
  <entry>
    <id>tag:github.com,2008:Repository/41881900/1.22.1</id>
    <updated>2018-04-06T08:06:35+08:00</updated>
    <link rel="alternate" type="text/html" href="https://github.com/Microsoft/vscode/releases/tag/1.22.1"/>
    <title>1.22.1</title>
    <content type="html">&lt;p&gt;Empty commit since the previous was a bad build for 1.22.1&lt;/p&gt;</content>
    <author>
      <name>roblourens</name>
    </author>
    <media:thumbnail height="30" width="30" url="https://avatars3.githubusercontent.com/u/323878?s=60&amp;v=4"/>
  </entry>
</feed>
```

### Action

#### Email

Subject

```
1.22.2, Release notes from vscode
{{EntryTitle}}, {{FeedTitle}}
```

`{{EntryTitle}} = <feed><entry><title>`

`{{FeedTitle}} = <feed><title>`

Body

```
{{EntryContent}},<br><br>
via {{FeedTitle}}, {{EntryUrl}}
```

```
<p>update release number</p>,<br><br>
via Release notes from vscode, <a href="https://ift.tt/2EDKxOx" target="_blank" data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=https://ift.tt/2EDKxOx&amp;source=gmail&amp;ust=...&amp;usg=...">https://ift.tt/2EDKxOx</a>
```

`https://ift.tt/2EDKxOx` is the short-link to jump to `https://github.com/Microsoft/vscode/releases/tag/1.22.2`