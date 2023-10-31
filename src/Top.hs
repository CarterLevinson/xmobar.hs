import Xmobar

import Config
import Icons
import Utils
import Monitors

-- makeTemplateStr = icon "lambda222.xpm" ++ "%_XMONAD_LOG_0%" ++ "}{"
--     -- ++ "| " ++ fn 1 clockIcon  ++ " %uptime% "
--     ++ "| " ++ cpuMS     ++ " %multicpu% %multicoretemp% "
--     ++ "| " ++ memAltMS  ++ " %memory% "
--     ++ "| " ++ storageNF ++ " %disku% " ++ diskNF ++ " "
--     ++ "| %alsa:default:Master% "
--     ++ "| " ++ bellNF   ++ " %updates% "
--     ++ "| %KMDW% "
--     ++ "| " ++ archNF ++ " " ++ click "(date; sleep 10) | dzen2" "%time% " -- ++ fn 1 clock
    -- ++ icon "arch-linux-6.xpm"
    -- ++ icon "arch-linux-2.xpm"
    -- ++ "| %time% "
    -- ++ click "echo test" bellIcon ++ " %updates% |"

      -- , template =
      --     "<icon=arch-linux-2.xpm/> %_XMONAD_LOG_0% }{\
      --       \| %default:Master% | %arch% CPU: %cpu% %cpufreq% %multicoretemp% | %memory% %swap% \
      --       \| %bell% %updates% | %wlp8s0% | %clock% %uptime% | %date% \
      --       \| %KMDW% | %time% "
      --

-- layout = icon "lambda222.xpm" ++ %_XMONAD_LOG_TOP% ++ "}{"

swap = Swap ["-t", swapNF ++ " <usedratio>", "-S", "On" ] 10

swapBar = Com "bash" ["/home/carterlevo/.xmobar/scripts/swap.sh"] "swapbar" 10

-- makeTemplate = icon "haskell-logo-20x20.xpm"
--     ++ " %wlp8s0wi% %dynnetwork% | "
--     ++ cpuMS ++ " %multicpu% %cpufreq% %multicoretemp% | "
--     ++ " }{  | "
--     ++ memMS ++ " %memory% %swap% | "
--     ++ diskNF ++ " %disku% " ++ serverNF ++ " | "
--     ++ "%alsa:default:Master% "
--
makeTemplate = ""
    -- icon "haskell-logo-20x20.xpm" ++ " "
    ++ lbar " %wlp8s0wi% " ++ "%dynnetwork% "
    ++ lbar (" " ++ cpuMS )
    ++ rbar " %multicpu% %cpufreq% %multicoretemp% "
    ++ " }{ "
    ++ lbar (" " ++  memMS)
    ++ " %memory% " ++ swapNF ++ " %swapbar% "
    ++ lbar (" " ++ diskNF)
    ++ " %disku% " ++ serverNF ++ " "
    ++ lbar " %alsa:default:Master% "

-- makeTemplate = icon "haskell-logo-white-20x20.xpm" ++ " %alsa:default:Master% "
--     ++ "| "  ++ serverNF ++ " %dynnetwork% %wlp8s0wi% "
--     ++ "}{ " ++ cpuMS    ++ " %multicpu% %cpufreq% %multicoretemp% "
--     ++ "| "  ++ memMS    ++ " %memory% "
--     ++ "| "  ++ diskNF   ++ " %disku% "

    -- , CPU -- bar, temp, freq
    -- , Memory -- bar,
    -- , Swap, -- bar
    -- , DISK, bar and io
    -- , Network, bar, speeed, signal
runnables =
    [ Run $ XPropertyLog "_XMONAD_LOG_TOP"
    -- , Run $ diskIO baseDark
    --     [ ("/", "/ <total> <read> <write>")
    --     , ("/home", "~ <total> <read> <write>")
    --     ]
    , Run $ diskU baseDark
        [ ("/", "/ [<usedbar>]")
        , ("/home", "~ [<usedbar>]")
        ]
    , Run $ cpuBar baseDark
    , Run $ cpuFreq baseDark
    , Run $ cpuTemp baseDark
    , Run $ memory baseDark
    , Run $ networkIO baseDark
    , Run $ wireless baseDark "wlp8s0"
    , Run $ masterVolumeAlsa baseDark "default"
    , Run swap
    , Run swapBar
    ]

config =
    let def = base baseDark
     in configFromArgs def
        { position = OnScreen 0 (TopH 24)
        , border   = NoBorder
        , commands = runnables
        , template = makeTemplate
        }

main :: IO ()
main = config >>= xmobar




-- main :: IO ()
-- main = config >>= xmobar
