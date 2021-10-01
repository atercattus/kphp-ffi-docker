#!/bin/bash

docker build -t kphp-ffi . || exit 1

docker run --rm -it \
    -v $(pwd):/src \
    kphp-ffi:latest \
    --mode cli \
    -o /src/out.bin \
    /src/test.php || exit 1

./out.bin
