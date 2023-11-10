#!/bin/bash

# checkupdates | wc -l | sed -r 's/^/ /;s/^ 0//'

count=$(checkupdates | wc -l)

if [[ "$count" -ne 0 ]]; then
  printf " %d" $count
fi
