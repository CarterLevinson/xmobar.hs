#!/bin/bash

count=$(dunstctl count history)

if [[ "$count" -ne 0 ]]; then
  printf " %d" $count
fi
