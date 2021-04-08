#!/bin/bash
set -e

pages="sitemap.xml
index.html"

for p in $pages; do
  p="_site/$p"
  if [ ! -f $p ]; then
    echo "page $p doesn't exist!"
    exit -1
  fi
done