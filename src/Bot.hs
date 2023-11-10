import Xmobar

import Config
import Icons
import Utils
import Monitors

-- calendar = "./home/carterlevo/.xmobar/scripts/caendar.sh"
-- -- updates = "./home/carterlevo/.xmobar/scripts/updates/sh"
--
-- updates = "sh -c notify-send 'Pending Updates: $(checkupdates)"

cal :: Date
cal =
    Date
    "%B %e %Y"
    "calendar"
    360000

time :: Date
time =
    Date
    (fc "#ECEFF4" "%H:%M")
    "time"
    10

mailx :: MailX
mailx =
    MailX
    [ ("G", "gmail/Inbox", "blue")
    , ("P", "posteo/Inbox", "orange")
    , ("WS", "workspace/Inbox", "purple")
    ]
    [ "-d", "~/mail", "-p", " "]
    "mailx"

uptime :: Monitors
uptime =
    Uptime
    [ "-t", "<days>d <hours>h" ]
    36000

updates :: Command
updates =
    Com (scriptify "pacman-count.sh")
    []
    "updates"
    3600

notify :: Command
notify =
    Com (scriptify "dunst-status.sh")
    []
    "notify"
    20

notifyCount :: Command
notifyCount =
    Com (scriptify "dunst-count.sh")
    []
    "notify-count"
    600


runnables :: [Runnable]
runnables =
    [ Run $ XPropertyLog
        "_XMONAD_LOG_BOT"
    , Run $ XPropertyLog
        "_XMONAD_LOG_MODE"
    , Run $ weatherX
        baseDark
        "KMDW"
    -- , Run $ wireless
    --     baseDark
    --     "wlp8s0"
    , Run mailx
    , Run time
    -- , Run cal
    , Run uptime
    , Run notify
    , Run updates
    , Run notifyCount
    ]

makeLayout :: String
makeLayout =
    icon "arch-linux-white-20x20.xpm"
    ++ " "
    ++ lbar " %_XMONAD_LOG_BOT% "
    ++ " }{ "
    ++ lbar (" " ++ click (scriptify "switch-email.sh") (
        rclick "wmctrl -s 0" mailMS))
    ++ "%mailx% "
    -- ++ lbar (" " ++ bellAltNF)
    ++ lbar (" " ++ click "dunstctl set-paused toggle" (
        rclick "dunstctl history-pop" "%notify%"))
    ++ "%notify-count% "
    ++ lbar (" " ++ updateNF)
    ++ " %updates%"
    ++ hbox " %KMDW% "
    ++ lbar (" " ++ hourglassNF)
    ++ " %uptime% "
    ++ lbar (" " ++ calendarNF)
    ++ rbar " %time% "
    ++ " "
    ++ icon "xmonad-logo-2022-20x20.xpm"
    ++ " "

config :: Config
config =
    let def = base baseDark
     in def
        { position = OnScreen 0 (BottomH 24)
        , border   = NoBorder
        , commands = runnables
        , template = makeLayout
        , wmName   = "xmobar-bot"
        }

main :: IO ()
main =  configFromArgs config >>= xmobar
