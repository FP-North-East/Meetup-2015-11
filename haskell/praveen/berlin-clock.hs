

-- This code only returns a list of Booleans for each row in Berlin clock. 
-- The time is not plumbed to date time library yet just hardcoded


--import Data.Time

--HOURS = 22
--MINUTES = 30

--TOP_ROW_HOURS_FACTOR = 5
--BOTTOM_ROW_HOURS_FACTOR = 1
--TOP_MINUTES_FACTOR = 5
--BOTTOM_MINUTES_FACTOR = 1
--TopRowHours :: (Integer, Integer, Integer, Integer)
--let topRowHours =  (0, 0, 0, 0)
--let bottomRowHours = (0, 0, 0, 0)

--let topMinutes = (0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
--let bottomMinutes = (0, 0, 0, 0)


main = do
  putStrLn $ show $ getTopRowHours 22 
  putStrLn $ show $ getBottomRowHours 22
  putStrLn $ show $ getTopRowMinutes 30
  putStrLn $ show $ getBottomRowMinutes 30


type LightOn = Bool

checkLight :: (Int -> Int -> Int) -> Int -> [LightOn]
checkLight divider n = (lightOns ++ (repeat False))
  where lightOns = take (n `divider` 5) (repeat True)

getTopRowHours :: Int -> [LightOn]
getTopRowHours h = take 4 $ checkLight div h

getBottomRowHours :: Int -> [LightOn]
getBottomRowHours h = take 4 $ checkLight rem h

getBottomRowMinutes :: Int -> [LightOn]
getBottomRowMinutes m = take 4 $ checkLight rem m

getTopRowMinutes :: Int -> [LightOn]
getTopRowMinutes m = take 11 $ checkLight div m


-- Hours: TopRow[0, 1, 2, 3] BottomRow[0, 1]  Minutes: TopRow[0, 1, 2, 3, 4, 5, 6] BottomRow[] Seconds: Boolean

