import Xmobar

import Config
import Icons
import Utils
import Monitors


swap :: Monitors
swap =
    Swap
    ["-t", swapNF ++ " <usedratio>", "-S", "On" ]
    10

swapbar :: Command
swapbar =
    Com "bash"
    ["/home/carterlevo/.xmobar/scripts/swap.sh"]
    "swapbar"
    10

runnables :: [Runnable]
runnables =
    [ Run $ XPropertyLog
        "_XMONAD_LOG_TOP"
    , Run $ diskIO baseDark
        [ ("/", "/ <total> <read> <write>")
        , ("/home", "~ <total> <read> <write>")
        ]
    , Run $ diskU baseDark
        [ ("/", "/ [<usedbar>]")
        , ("/home", "~ [<usedbar>]")
        ]
    , Run $ masterVolumeAlsa baseDark
        "default"
    , Run $ wireless baseDark
        "wlp8s0"
    , Run $ networkIO baseDark
    , Run $ cpuFreq baseDark
    , Run $ cpuBar baseDark
    , Run $ cpuTemp baseDark
    , Run $ memory baseDark
    , Run swapbar
    , Run swap
    ]

makeLayout :: String
makeLayout =
    lbar " %wlp8s0wi% " ++ "%dynnetwork% "
    ++ lbar (" " ++ cpuMS )
    ++ rbar " %multicpu% %cpufreq% %multicoretemp% "
    ++ " }{ "
    ++ lbar (" " ++  memMS)
    ++ " %memory% " ++ swapNF ++ " %swapbar% "
    ++ lbar (" " ++ diskNF)
    ++ " %disku% " ++ serverNF ++ " "
    ++ lbar " %alsa:default:Master% "


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




-- main :: IO ()
-- main = config >>= xmobar
