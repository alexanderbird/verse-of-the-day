#!/bin/bash

rm -rf ./www
mkdir www

./build.sh | pandoc -f markdown -t html > www/index.html
