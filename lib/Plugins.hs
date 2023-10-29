module Plugins where

import Xmobar
import Xmobar.Plugins.Monitors.Cpu
import Xmobar.Plugins.Monitors.Common

-- variables =


--
--
--
-- -- makeMultiCoreTempArgs p n =
--
-- -- startMultiCpuTemp p n =
-- --     let args = [ "-t", "<core" ++ show n ++ ">°C"
-- --                , "-L", "60"
-- --                , "-H", "80"
-- --                ]
-- --         exts = [ "--mintemp", "20"
-- --                , "--maxtemp", "100"
-- --                ]
-- --      in startMultiCoreTemp (mkArgs p args exts) 20
-- --
-- makeMultiCpuLoadArgs n =
--     [ "-t", "[<bar" ++ show n ++ ">]"
--     , "-b", "•"
--     , "-L", "25"
--     , "-H", "75"
--     ]
--
-- makeCpuFreqArgs n =
--     [ "-t", "<cpu" ++ show n ++ ">GHz"
--     , "-L", "1"
--     , "-H", "4"
--     ]
--
-- data NamedMonitors
--     = IndexedMultiCoreTemp Int [String]
--     | IndexedMultiCpuLoad  Int [String]
--     | IndexedCpuFrequency  Int [String]
--     deriving (Show, Read)
--
-- instance Exec NamedMonitors where
--     alias (IndexedMultiCoreTemp n _) = "temp" ++ show n
--     alias (IndexedMultiCpuLoad n _)  = "load" ++ show n
--     alias (IndexedCpuFrequency n _)  = "freq" ++ show n
--
-- -- data IndexedMultiCoreTemp = IMCT Int [String]
-- --     deriving (Read, Show)
--
-- -- instance Exec IndexedMultiCoreTemp where
--     -- alias (IndexedMultiCoreTemp n _) = "temp" ++ show n
--
--
-- -- data IndexedCpuFrequency =
-- --     IndexedCpuFrequecy Integer Monitors
-- --
-- -- data IndexedCpu =
-- --     IndexedCpu Integer Monitors
-- --
