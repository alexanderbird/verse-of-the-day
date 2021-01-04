#!/bin/bash

set -e

function renderOneDay() {
  readonly local path=$0
  
  readonly local title=$(echo "$path" | sed "s/.\/\([0-9]\{4\}\)\/\([0-9]\{2\}\)\/\([0-9]\{2\}\)\.md/## \1-\2-\3/")
  echo
  echo "<article>"
  echo $title
  echo
  cat $path
  echo "</article>"
}

export -f renderOneDay

cat ./README.md
extra_find_flags="$([ "$(uname -s)" = "Darwin" ] && echo "" || echo "-regextype sed")"

find . $extra_find_flags -regex "./[0-9]\{4\}/[0-9]\{2\}/[0-9]\{2\}\.md" | sort -r | xargs -n 1 bash -c renderOneDay

