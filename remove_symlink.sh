#!/bin/sh
IGNORE_PATTERN="(.+\.sh)|(^\.DS_Store)|(^\.gitignore$)"
CURRENT_DIR=$(cd $(dirname $0);pwd)
find . -type f -d 1 | awk -F/ '{print $NF}' | \
  egrep -v $IGNORE_PATTERN | xargs -p -I% rm $HOME/%
