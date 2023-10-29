import Xmobar

import Config
import Icons
import Utils
import Monitors

calendar = "./home/carterlevo/.xmobar/scripts/caendar.sh"
-- updates = "./home/carterlevo/.xmobar/scripts/updates/sh"

updates = "sh -c notify-send 'Pending Updates: $(checkupdates)"


makeTemplate :: String
makeTemplate = icon "arch-linux-white-20x20.xpm" ++ " "
    ++ "%_XMONAD_LOG_BOT% } %mpris2% { "
    ++ "| %mail% "
    ++ "| " ++ click updates bellNF ++ " %updates% "
    ++ "| %KMDW% "
    ++ "| " ++ clockNF ++ " %uptime% "
    ++ "| " ++ click calendar calendarNF ++ " %time% "

date = Date "%a %m-%d-%Y" "date" 36000

time = Date (fc "#FFFFFF" "%H:%M") "time" 10

mail :: MailX
mail = MailX
    [ ("G", "gmail/Inbox", "green")
    , ("P", "posteo/Inbox", "orange")
    ]
    [ "-d", "~/mail", "-p", mailNF ++ " " ]
    "mail"

uptime = Uptime
    [ "-t", "<days>d <hours>h" ]
    36000

checkUpdates = Com "bash"
    [ "-c", "checkupdates | wc -l" ]
    "updates"
    3600

spotify = Mpris2 "spotify"
    [ "-t", spotifyNF ++ " <artist> - <title> [<album>]"
    , "-x", ""
    ]
    10

runnables =
    [ Run $ XPropertyLog "_XMONAD_LOG_BOT"
    , Run mail
    , Run time
    , Run uptime
    , Run spotify
    , Run checkUpdates
    , Run $ weatherX baseDark "KMDW"
    , Run $ wireless baseDark "wlp8s0"
    ]

config =
    let def = base baseDark
     in configFromArgs def
        { position = OnScreen 0 (BottomH 24)
        , border   = NoBorder
        , commands = runnables
        , template = makeTemplate
        }

main :: IO ()
main = config >>= xmobar
