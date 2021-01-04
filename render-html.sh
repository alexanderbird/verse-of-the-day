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

    <link rel="manifest" href="manifest.json">
    <link rel="apple-touch-icon" href="images/icon-48x.png">
    <link rel="apple-touch-icon" sizes="48x48" href="images/icon-48x.png">
    <link rel="apple-touch-icon" sizes="72x72" href="images/icon-72x.png">
    <link rel="apple-touch-icon" sizes="96x96" href="images/icon-96x.png">
    <link rel="apple-touch-icon" sizes="144x144" href="images/icon-144x.png">
    <link rel="apple-touch-icon" sizes="168x168" href="images/icon-168x.png">
    <link rel="apple-touch-icon" sizes="192x192" href="images/icon-192x.png">

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
