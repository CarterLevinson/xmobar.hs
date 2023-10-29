module Utils where

fc :: String -> String -> String
fc color thing = "<fc=" ++ color ++ ">" ++ thing ++ "</fc>"

fn :: Integer -> String -> String
fn n thing = "<fn=" ++ show n ++ ">" ++ thing ++ "</fn>"

icon :: String -> String
icon file = "<icon=" ++ file ++ "/>"

wrap thing = "<box type=HBoth mb=1 ml=2 mr=1 width=2 color=white>"
    ++ thing
    ++ "</box>"

click :: String -> String -> String
click cmd thing = "<action=`" ++ cmd ++ "`"
    ++ " button=1>"
    ++ thing
    ++ "</action>"

-- action
-- box s = s
