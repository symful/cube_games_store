#!/usr/bin/bash

flutter build web
cd build/web
RANDOM_STRING=$(date +%s%N | sha256sum | head -c 16)

sed -i "s/{{RANDOM}}/$RANDOM_STRING/g" index.html
deployctl deploy --prod --project=cubegamesstore --save-config https://jsr.io/@std/http/1.0.7/file_server.ts


