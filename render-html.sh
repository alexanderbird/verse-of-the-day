#!/bin/bash

rm -f ./www/index.html
mkdir -p ./www
touch ./www/index.html

cat >> ./www/index.html << EOF
<!doctype html>

<html lang="en">
  <head>
    <meta charset="utf-8">

    <title>Verse of the Day</title>
    <link rel="icon" href="data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 100 100%22><text y=%22.9em%22 font-size=%2290%22>📖</text></svg>">
    <meta name="description" content="Alex's verse of the day">

    <!-- https://watercss.kognise.dev/ -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/water.css@2/out/water.css">
    <link rel="stylesheet" href="./style.css">
  </head>

  <body>
EOF

./render-markdown.sh | pandoc -f markdown -t html >> www/index.html

cat >> ./www/index.html << EOF
  </body>
</html>
EOF
