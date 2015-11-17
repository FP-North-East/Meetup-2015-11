import System.Posix.Unistd
import System.Posix.Unistd
import Data.Char
import Data.Time
import Data.Time.Clock

data Fred = MkFred { hour_blocks :: Int,
                     hour_units :: Int, 
                     minute_blocks :: Int,
                     minute_units :: Int,
                     even_seconds :: Bool } deriving (Eq, Show)


time_to_fred :: (Int, Int, Int) -> Fred
time_to_fred (h,m,s) 
  = MkFred { hour_blocks = h `div` 5,
             hour_units  = h `mod` 5, 
             minute_blocks = m `div` 11, 
             minute_units  = m `mod` 11, 
             even_seconds  = even s }

t1 = time_to_fred (13,26,48) == MkFred 2 3 2 4 True


fred_to_display :: Fred -> String
fred_to_display f
 = unlines [ if even_seconds f then "*" else "_"
           , padded_row 4 (hour_blocks f)
           , padded_row 4 $ hour_units f
           , take 11 (minute_block_row ++ repeat '_')
           , padded_row 4 (minute_units f)  
           ]
   where
     minute_block_row = take (minute_blocks f) $ cycle "**|"
     padded_row = \ sz n -> take sz $ replicate n '*' ++ repeat '_'


x |> f = f x 

t2 = (13,26,48) |> time_to_fred |> fred_to_display 


-- berlin :: LocalTime -> String
berlin d 
  = (h,m, floor s) |> time_to_fred |> fred_to_display
    where (TimeOfDay h m s) = d

main 
 = sequence_ $ repeat show_time

show_time
 = do 
     t <- getCurrentTime
     z <- getCurrentTimeZone
     let localtime = localTimeOfDay $ utcToLocalTime z t
     putStrLn $ show t
     putStrLn $ berlin localtime
     putStrLn $ unlines $ replicate 10 ""
     sleep 1
