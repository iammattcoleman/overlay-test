#!/bin/bash
set -euf -o pipefail

# clean up any existing build artifacts
rm -rf output

# build
time kiwi-ng-3 --type iso --debug --temp-dir=${KIWI_TEMP_DIR:-/var/tmp} \
    system build --description=image-description --target-dir=output 2>&1
