import Data.Fixed
import Prelude hiding ((/))
import Data.List
import Data.Time

(%) = mod
(/) = div


main = run

run =
  do t <- getCurrentTime
     timeZone <- getTimeZone t
     let tod = localTimeOfDay $ utcToLocalTime timeZone t
     let h = todHour tod
     let min = todMin tod
     let sec = todSec tod
     let zt = utcToLocalZonedTime t
     -- let c = Clock True 1 2 3 3
     let d = mkClock h min sec
     putStrLn $ render d


data Clock = Clock
  { evenSec :: Bool
  , fiveHr  :: Int
  , oneHr :: Int
  , fiveMin :: Int
  , oneMin :: Int
  } deriving (Show)

render
  :: Clock
  -> String
render (Clock evenSec fiveHr oneHr fiveMin oneMin) =
  intercalate "\n"
  [ r1
  , r2
  , r3
  , r4
  , r5
  ]
  where
    r1 = if evenSec then "*" else "0"
    r2 = replicate (fiveHr) '*'
    r3 = replicate (oneHr) '*'
    r4 = replicate (fiveMin) '*'
    r5 = replicate (oneMin) '*'

mkClock
  :: Int -- hr
  -> Int -- min
  -> Pico -- sec
  -> Clock
mkClock hr min sec =
  Clock (mod' sec 2==0) (hr/5) (hr%5) (min/5) (min%5)



