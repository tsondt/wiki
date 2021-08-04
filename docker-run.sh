#!/usr/bin/env bash

docker run --rm -v $PWD:/srv -p 4000:4000 "tsondt/wiki" check ||
docker run --rm -v $PWD:/srv -p 4000:4000 "tsondt/wiki" install &&
docker run -ti --rm -v $PWD:/srv -p 4000:4000 "tsondt/wiki" exec jekyll serve --host 0.0.0.0 --port 4000 $1