#!/bin/bash
mkdir -p ./hugo/content/post
for f in ./*.md
do
  sed -e 's/\[hm\]\ *:\ *#\ *(\(.*\))/\1/g' $f > ./hugo/content/post/$f
done
cd blogPosts
for f in ./*.md
do
  sed -e 's/\[hm\]\ *:\ *#\ *(\(.*\))/\1/g' $f > ../hugo/content/post/$f
done
cd ..
for f in ./*.md
do
  sed -i 's/\.\/\([^\.]*\)\.md/\/post\/\1/g' ./hugo/content/post/$f
done
rm ./hugo/content/post/README.md
./othtohugo.sh
