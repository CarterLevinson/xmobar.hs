#!/bin/bash

paused=$(dunstctl is-paused)

if [[ "$paused" == true ]]; then
  # material design notifications off icon
  printf "<fn=2>\uE7F6</fn>"
  # font awesome notifications off icon
  # printf "<fn=1>\uF1F7</fn>"
else
  # material design notifications on icon
  printf "<fn=2>\uE7F4</fn>"
  # font awesome notifications on icon
  # printf "<fn=1>\uF0A2</fn>"
fi
