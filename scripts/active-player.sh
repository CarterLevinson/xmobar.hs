#!/bin/bash

activePlayer=$(playerctl -l 2>&1 | head -n 1)

case "$activePlayer" in
  spotify*)
    # font awesome spotify logo
    printf "<fn=1>\uF1BC</fn>";;
  firefox*)
    # firefox dev logo
    # printf "<fn=1>\uE745</fn>";;
    # font aeswsome firefox logo
    printf "<fn=1>\uF269</fn>";;
    # firefox material design
    # printf "<fn=1>\uF0239</fn>" ;;
  mpv)
    printf "<fn=1>\uF03D</fn>";;
    # printf "<fn=1>\uF0A1C</fn>";;
    # printf "<fn=1>\uF0567</fn>";;
  No*)
    # printf "<fn=1>\uF075B</fn>";;
    printf "<fn=1>\uFC59</fn>";;
  *)
    # printf "<fn=1>\uF075A</fn>";;
    printf "<fn=1>\uFC58</fn>";;
esac
