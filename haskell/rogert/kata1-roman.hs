-- developed in http://haskellformac.com; comments welcome

module RomanNumerals(roman, romanHourMark) where
  
roman :: Int -> Maybe String
roman n
  | n > 0     = Just $ roman' n
  | otherwise = Nothing

roman' :: Int -> String 
roman' n
  | n >= 1000 = 'M'  `foreach` 1000
  | n >= 900  = "CM" `for` 900
  | n >= 500  = "D"  `for` 500
  | n >= 400  = "CD" `for` 400
  | n >= 100  = 'C'  `foreach` 100
  | n >= 90   = "XC" `for` 90
  | n >= 50   = "L"  `for` 50
  | n >= 40   = "XL" `for` 40
  | n >= 10   = 'X'  `foreach` 10
  | n >= 9    = "IX" `for` 9
  | n >= 5    = "V"  `for` 5
  | n >= 4    = "IV" `for` 4
  | n >= 1    = 'I'  `foreach` 1
  | n == 0    = ""   -- terminates recursion
  | otherwise = "(no Roman numeral for negative value)"
  where 
    for    symbols v = symbols ++ roman' (n `mod` v)
    foreach symbol v = for (replicate (n `div` v) symbol) v

romanHourMark :: Int -> Maybe String
romanHourMark hour                     -- hour ∈ 0..23
  | hour <  0 || hour >  23 = Nothing
  | hour == 0 || hour == 12 = Just "XII"
  | hour == 4 || hour == 16 = Just "IIII"
  | otherwise = Just $ roman' (hour `mod` 12)
  