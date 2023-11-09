#!/bin/bash

wifiStatus=$(nmcli radio wifi)

if [[ "$wifiStatus" == "enabled" ]]; then
  printf "<fn=2>\uE63E</fn>"
else
  printf "<fn=2><fc=#FF003F>\uE648</fc></fn>"
fi
