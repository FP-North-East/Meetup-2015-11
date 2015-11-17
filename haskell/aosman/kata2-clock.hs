import Data.Fixed
import Prelude hiding ((/))
import Data.List
import Data.Time


(%) = mod
(/) = div


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
  [ if evenSec then "*" else "0"
  , f fiveHr
  , f oneHr
  , f fiveMin
  , f oneMin
  ]
  where
    f n = replicate n '*'


mkClock
  :: Int -- hr
  -> Int -- min
  -> Pico -- sec
  -> Clock
mkClock hr min sec =
  Clock (mod' sec 2==0) (hr/5) (hr%5) (min/5) (min%5)


run =
  do t <- getCurrentTime
     timeZone <- getTimeZone t
     let TimeOfDay h min sec = localTimeOfDay $ utcToLocalTime timeZone t
     let d = mkClock h min sec
     putStrLn $ render d


main = run
