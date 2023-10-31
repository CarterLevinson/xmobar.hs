module Utils where

fc :: String -> String -> String
fc color thing = "<fc=" ++ color ++ ">" ++ thing ++ "</fc>"

fn :: Int -> String -> String
fn n thing = "<fn=" ++ show n ++ ">" ++ thing ++ "</fn>"

icon :: String -> String
icon file = "<icon=" ++ file ++ "/>"

click :: String -> String -> String
click cmd  = action cmd 1

action :: String -> Int -> String -> String
action cmd button thing =
    "<action=`" ++ cmd ++ "`" ++ " button=" ++ show button ++ ">"
    ++ thing
    ++ "</action>"

lbar, rbar, hbox, vbox :: String -> String
lbar thing = "<box type=Left>"  ++ thing ++ "</box>"
rbar thing = "<box type=Right>" ++ thing ++ "</box>"
hbox thing = "<box type=HBoth>" ++ thing ++ "</box>"
vbox thing = "<box type=VBoth>" ++ thing ++ "</box>"
