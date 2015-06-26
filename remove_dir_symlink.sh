#!/bin/sh
IGNORE_PATTERN="(\.git)"
CURRENT_DIR=$(cd $(dirname $0);pwd)
find . -type d -d 1 | awk -F/ '{print $NF}' | \
  egrep -v $IGNORE_PATTERN | xargs -p -I% rm -r $HOME/%
