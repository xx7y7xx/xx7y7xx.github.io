---
layout: post
title: Convert HTML to a self contained file with inline Base64 encoded PNG images
---

## Files

Files are extracted from a ZIP file downloaded from Google Docs.

```
$ ls -lR input
total 24
-rw-rw-r--@ 1 d3vin  d3vin   8.1K Feb  2 22:14 index.html
drwxr-xr-x@ 7 d3vin  d3vin   224B Feb  3 14:14 images

input/images:
total 672
-rw-rw-r--@ 1 d3vin  d3vin    42K Feb  2 22:14 image1.jpg
-rw-rw-r--@ 1 d3vin  d3vin    37K Feb  2 22:14 image2.jpg
-rw-rw-r--@ 1 d3vin  d3vin    47K Feb  2 22:14 image3.jpg
```

## Run script

```
$ ./standalone_html.py input/index.html output.html
```

## Error

See this error,

```
ImportError: No module named bs4
```

then try install BeautifulSoup4.

```
$ pip install BeautifulSoup4
```

## References

- [pansapiens/standalone_html.py](https://gist.github.com/pansapiens/110431456e8a4ba4f2eb)
