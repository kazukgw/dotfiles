#!/bin/sh
IGNORE_PATTERN="(\.git)"
CURRENT_DIR=$(cd $(dirname $0);pwd)
find . -type d -d 1 | awk -F/ '{print $NF}' | \
  egrep -v $IGNORE_PATTERN | xargs -I% ln -s $CURRENT_DIR/% $HOME/
