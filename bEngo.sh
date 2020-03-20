#!/bin/bash

curl -s https://en.wikipedia.org/wiki/$1 -o tmp_wiki.html #download wikipage

name=$(cat tmp_wiki.html  | grep -i '<title>' | cut -d '>' -f 2 | cut -d '<' -f 1 | cut -d '-' -f 1) #get title of the page

echo $1, $name

rm tmp_wiki.html