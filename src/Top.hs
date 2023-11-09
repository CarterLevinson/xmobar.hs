import Xmobar

import Config
import Icons
import Utils
import Monitors

player :: Command
player =
    Com (scriptify "active-player.sh")
    -- Com "/home/carterlevo/.xmobar/scripts/active-player.sh"
    []
    "player"
    10

playerctld :: Monitors
playerctld =
    Mpris2 "playerctld"
    [ "-t", "<title> - <artist> (<album>)"
    , "-T", "200"
    , "-x", ""
    ]
    10

swap :: Monitors
swap =
    Swap
    ["-t", swapNF ++ " <usedratio>", "-S", "On" ]
    20

swapbar :: Command
swapbar =
    Com (scriptify "swapbar.sh")
    []
    "swapbar"
    20

wifi :: Command
wifi =
    Com (scriptify "wifi-status.sh")
    []
    "wifi"
    20

runnables :: [Runnable]
runnables =
    [ Run $ XPropertyLog
        "_XMONAD_LOG_TOP"
    , Run $ diskIO
        baseDark
        [ ("/", "/ <total> <read> <write>")
        , ("/home", "~ <total> <read> <write>")
        ]
    , Run $ diskU
        baseDark
        [ ("/", "/ [<usedbar>]")
        , ("/home", "~ [<usedbar>]")
        ]
    , Run $ masterVolumeAlsa
        baseDark
        LeftSide
        "default"
    , Run $ wireless
        baseDark
        "wlp8s0"
    , Run $ networkIO
        baseDark
        LeftSide
    , Run $ cpuFreq
        baseDark
    , Run $ cpuBar
        baseDark
    , Run $ cpuTemp
        baseDark
    , Run $ memory
        baseDark
    , Run playerctld
    , Run player
    , Run swapbar
    -- , Run swap
    , Run wifi
    ]

makeLayout :: String
makeLayout =
    "%alsa:default:Master% "
    ++ lbar (" " ++ cpuMS)
    ++ " %multicpu% %cpufreq% %multicoretemp% "
    ++ lbar (" " ++ memAltMS)
    ++ " %memory% "
    ++ swapAltNF
    ++ rbar " %swapbar% "
    ++ "} ["
    ++ click "playerctl play-pause" (playNF ++ "/" ++ pauseNF)
    ++ "] %mpris2% ["
    ++ click "playerctld shift" (rclick "playerctld unshift" "%player%")
    ++ "] {"
    ++ lbar (" " ++ serverNF)
    ++ " %disku% "
    ++ lbar " %dynnetwork% "
    ++ click (scriptify "wifi-toggle.sh") "[%wifi%]"
    ++ " %wlp8s0wi%"


config :: Config
config =
    let def = base baseDark
     in def
            { position = OnScreen 0 (TopH 24)
            , border   = NoBorder
            , commands = runnables
            , template = makeLayout
            }

main :: IO ()
main = configFromArgs config >>= xmobar
