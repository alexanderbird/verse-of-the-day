#!/bin/bash

function renderOneDay() {
  readonly local path=$0
  
  readonly local title=$(echo "$path" | sed "s/.\/\([0-9]\{4\}\)\/\([0-9]\{2\}\)\/\([0-9]\{2\}\)\.md/## \1-\2-\3/")
  echo
  echo $title
  echo
  cat $path
}

export -f renderOneDay

cat ./README.md
find . -regextype sed -regex "./[0-9]\{4\}/[0-9]\{2\}/[0-9]\{2\}\.md" | sort -r | xargs -n 1 bash -c renderOneDay
