#!/bin/bash

SWAP=$(grep SwapTotal /proc/meminfo | awk '{print $2}')
FREE=$(grep SwapFree /proc/meminfo  | awk '{print $2}')

USED=$(echo "($SWAP - $FREE) / $SWAP * 100" | bc)

BARS=$(echo "$USED / 10" | bc)

case $BARS in
  0)  BAR='[••••••••••]' ;;
  1)  BAR='[#•••••••••]' ;;
  2)  BAR='[##••••••••]' ;;
  3)  BAR='[###•••••••]' ;;
  4)  BAR='[####••••••]' ;;
  5)  BAR='[#####•••••]' ;;
  6)  BAR='[######••••]' ;;
  7)  BAR='[#######•••]' ;;
  8)  BAR='[########••]' ;;
  9)  BAR='[#########•]' ;;
  10) BAR='[##########]' ;;
  *)  BAR='[----!!----]' ;;
esac

echo "$BAR"
