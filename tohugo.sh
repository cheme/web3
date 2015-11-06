#!/bin/bash
mkdir -p ./hugo/content/post
for f in ./*.md
do
  sed -e 's/\[hm\]\ *:\ *#\ *(\(.*\))/\1/g' $f > ./hugo/content/post/$f
done
for f in ./*.md
do
  sed -i 's/\.\/\([^\.]*\)\.md/\/post\/\1/g' ./hugo/content/post/$f
done
