#!/bin/bash

set -e

function renderOneDay() {
  readonly local path=$0
  
  readonly local year=$(echo "$path" | sed "s/.\/\([0-9]\{4\}\)\/\([0-9]\{2\}\)\/\([0-9]\{2\}\)\.md/\1-\2-\3/")
  echo
  echo "<article id='$year'>"
  echo "## $year"
  echo
  cat $path \
    | sed "s/^### Notes.*$/<h3 class='notes-header'>Notes<\/h3>/" \
    | sed "s/LORD/<span title='YHWH, covenant name of God'><span class='YHWH__first'>L<\/span><span class='YHWH__rest'>ord<\/span><\/span>/g" \
    | sed "s/GOD/<span title='YHWH, covenant name of God'><span class='YHWH__first'>G<\/span><span class='YHWH__rest'>od<\/span><\/span>/g"
  echo "</article>"
}

export -f renderOneDay

cat ./README.md
extra_find_flags="$([ "$(uname -s)" = "Darwin" ] && echo "" || echo "-regextype sed")"

find . $extra_find_flags -regex "./[0-9]\{4\}/[0-9]\{2\}/[0-9]\{2\}\.md" | sort -r | xargs -n 1 bash -c renderOneDay

