module Monitors where

import Config
import Icons
import Utils
import Xmobar

kernel :: Command
kernel = Com "bash"
    [ "-c", "uname" ++ " " ++ "-r" ]
    "kernel"
    3600000

wireless :: Palette -> Interface -> Monitors
wireless p n =
    let args = [ "-t", wifiOnNF ++ " [<qualitybar>] <signal>dBm"
               , "-b", "•"
               , "-x", ""
               -- fc (pLow p) (fni "\xf1eb " ++ "<essid>")
               -- <quality>\xf09e
               -- , "-m", "3"
               -- , "-M", "15"
               -- , "-W", "5"
               , "-L", "20"
               , "-H", "80"
               ]
     in Wireless n (p >~< args) 20

-- networkUP

masterVolumeAlsa :: Palette -> String -> Monitors
masterVolumeAlsa p mixer = Alsa mixer
    "Master"
    [ "-t", click "pulseaudio-ctl mute" "[<status>]" ++ " [<volumebar>]"
    , "-b", "•"
    , "--"
    , "-O", volNF
    , "-o", muteNF
    , "-C", pForeground p
    , "-c", "#8B4726"
    ]

weatherX' :: Station -> Args -> Rate -> Monitors
weatherX' station = WeatherX station
    [ ("", "")
    , ("clear", fn 1 "\xF0599")
    , ("sunny", fn 1 "\xF0599")
    , ("fair",  fn 1 "\xF0599")
    , ("mostly clear", "🌤️")
    , ("mostly sunny", "🌤️")
    , ("partly sunny", "⛅")
    , ("obscured", fn 1 "\xF0F2F")
    , ("fog", fn 1 "\xF0591")
    , ("foggy", fn 1 "\xF0591")
    , ("cloudy", fn 1 "\xF0590")
    , ("overcast", fn 1 "\xF0590")
    , ("partly cloudy", fn 1 "\xF0595")
    , ("mostly cloudy", fn 1 "\xF0590")
    , ("considerable cloudiness",fn 1 "\xE312")
    , ("light rain", fn 1 "\xE309")
    , ("rain", fn 1 "\xF0596")
    , ("lightning", fn 1 "\xF067E")
    , ("ice crystals", "❄️")
    , ("light snow", "🌨️")
    , ("snow", "❄️")
    ]

weatherX :: Palette -> Station -> Monitors
weatherX p station =
    let args = [ "-t", "<skyConditionS> <tempC>°C"
               , "-L", "0"
               , "-H", "25"
               ]
     in weatherX' station (p <~> args) 3600

cpuBar :: Palette -> Monitors
cpuBar p =
    let args = [ "-t", "[<bar>]"
               , "-b", "•"
               , "-H", "75"
               , "-L", "25"
               ]
     in MultiCpu (p <~> args) 10


cpuFreq :: Palette -> Monitors
cpuFreq p =
    let args = [ "-t", "<avg>GHz"
               , "-H", "4"
               , "-L", "1"
               ]
     in CpuFreq (p <~> args) 20

cpuTemp :: Palette -> Monitors
cpuTemp p =
    let args = [ "-t", "<avg>°C" --, "Temp: <avgpc>%"
               , "-L", "60"
               , "-H" , "80"
               ]
        exts = [ "--mintemp", "20"
               , "--maxtemp", "100"
               ]
     in MultiCoreTemp (mkArgs p args exts) 20

memory :: Palette -> Monitors
memory p =
    let args = [ "-t", "[<usedbar>]" -- <used>M
               , "-b", "•"
               , "-H", "75"
               , "-L", "25"
               ]
     in Memory (p <~> args) 10

diskU :: Palette -> DiskSpec -> Monitors
diskU p disks =
    let args = [ "-b", "•"
               -- , "-m", "1"
               -- , "-p", "3"
               , "-L", "20"
               , "-H", "70"
               ]
     in DiskU disks (p <~> args) 30

diskIO :: Palette -> DiskSpec -> Monitors
diskIO p disks =
    let args = []
        pal  = (p <~> args)
     in DiskIO disks [] 10

networkIO :: Palette -> Monitors
networkIO p =
    let args = [ "-t", up2NF ++ " [<txbar>] " ++ down2NF ++ " [<rxbar>]"
               , "-b", "•"
               ]
     in DynNetwork (p <~> args) 20
