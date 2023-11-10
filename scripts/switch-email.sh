#!/bin/bash

email=$(wmctrl -d | \
  grep "Email" | \
  cut -d " " -f 1
)

wmctrl -s "$email"
