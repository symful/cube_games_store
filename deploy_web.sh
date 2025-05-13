#!/usr/bin/bash

flutter build web
cd build/web
deployctl deploy --prod --project=cubegamesstore --save-config https://jsr.io/@std/http/1.0.7/file_server.ts


