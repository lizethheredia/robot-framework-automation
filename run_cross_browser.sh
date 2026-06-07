#!/bin/bash

echo "Starting cross-browser parallel execution..."
mkdir -p results/chromium results/firefox results/webkit

pabot --processes 2 --pabotlib-port 8270 --variable BROWSER:chromium --outputdir results/chromium tests/web/ &
pabot --processes 2 --pabotlib-port 8271 --variable BROWSER:firefox --outputdir results/firefox tests/web/ &
pabot --processes 2 --pabotlib-port 8272 --variable BROWSER:webkit --outputdir results/webkit tests/web/ &

wait

echo "All browsers done. Merging results..."

rebot --outputdir results \
      --output output.xml \
      --log log.html \
      --report report.html \
      results/chromium/output.xml \
      results/firefox/output.xml \
      results/webkit/output.xml

echo "Done! Open results/report.html"
