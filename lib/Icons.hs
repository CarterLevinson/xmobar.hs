module Icons
    ( archNF
    , bellNF
    , lambdaNF
    , piNF
    , clockNF
    , calendarNF
    , serverNF
    , diskNF
    , mailNF
    , volNF
    , muteNF
    , swapNF
    , sunNF
    , spotifyNF
    , cloudNF
    , cloudsNF
    , wifiOnNF
    , wifiOffNF
    , cpuMS
    , memMS
    , memAltMS
    ) where

import Utils (fn)

-- nerd fonts

nf             = fn 1

archNF         = nf "\xF303"
bellNF         = nf "\xF0A2"
lambdaNF       = nf "\xFB26"
piNF           = nf "\xE22C"
clockNF        = nf "\xF64F"
calendarNF     = nf "\xF273"
serverNF       = nf "\xF233"
diskNF         = nf "\xF02CA"
volNF          = nf "\xF057E"
mailNF         = nf "\xF42F"
swapNF         = nf "\xF9E1"
muteNF         = nf "\xF0E08"
spotifyNF      = nf "\xF1BC"
wifiOnNF       = nf "\xF1EB"
wifiOffNF      = nf "\xF05AA"

-- storage = "\xe1db"

sunNF          = nf "\xF0599"
cloudNF        = nf "\xF0F2F"
cloudsNF       = nf "\xE312"

-- material symbols

ms             = fn 2

cpuMS          = ms "\xE30D"
memMS          = ms "\xE322"
memAltMS       = ms "\xF7A3"
