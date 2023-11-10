module Config  where

import Xmobar

data Orientation
    = LeftSide
    | RightSide

data Palette = Palette
    { pNormal     :: String
    , pLow        :: String
    , pHigh       :: String
    , pDim        :: String
    , pFont       :: String
    , pBorder     :: String
    , pForeground :: String
    , pBackground :: String
    , pIconRoot   :: String
    , pAlpha      :: Int
    , pIsLight    :: Bool
    , pWm         :: Maybe String
    }

-- baseLight = Palete

baseDark= Palette
    { pNormal     = "#ECEFF4" -- Nord White
    , pLow        = "#39FF14" -- Neon Green
    , pHigh       = "#FF003F" -- Electric Crimson
    , pDim        = "#646464"
    , pFont       = "Fira Code Bold 12"
    , pBorder     = "#DDDDDD"
    , pForeground = "#7F7F7F"
    , pBackground = "#121212"
    -- , pBackground = "#22242b" -- "#000000"
    , pAlpha      = 255
    , pIconRoot   = "/home/carterlevo/.xmobar/xpm"
    , pIsLight    = False
    , pWm         = Nothing
    }


base :: Palette -> Config
base p = defaultConfig
    { font             = pFont p
    , alpha            = pAlpha p
    , iconRoot         = pIconRoot p
    , bgColor          = pBackground p
    , fgColor          = pForeground p
    , borderColor      = pBorder p
    , border           = NoBorder
    , persistent       = False
    , allDesktops      = True
    , overrideRedirect = True
    , additionalFonts  =
        [ "Symbols Nerd Font 12"
        , "Material Symbols Sharp 12"
        ]
    }

(<~>) :: Palette -> [String] -> [String]
(<~>) p args =
  args ++ [ "--low", pLow p , "--normal", pNormal p , "--high", pHigh p]

(>~<) :: Palette -> [String] -> [String]
(>~<) p args =
  args ++ [ "--low", pHigh p , "--normal", pNormal p , "--high", pLow p]

mkArgs :: Palette -> [String] -> [String] -> [String]
mkArgs p args extra = concat [p <~> args, ["--"], extra]
