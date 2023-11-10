#!/bin/bash

if [[ "$#" -ne 1 ]]; then
  echo "USAGE: $0 coreNum"
  exit 1
fi

sensors | \
  grep "Core $1"  | \
  sed "s/[(][^)]*[)]//g" | \
  cut -d : -f 2 | \
  tr  -d + | \
  xargs
