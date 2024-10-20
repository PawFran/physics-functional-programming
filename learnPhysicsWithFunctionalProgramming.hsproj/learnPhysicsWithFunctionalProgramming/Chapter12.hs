module Chapter12 where

main :: IO ()
main = let l = [2^i | i <- [0..20]]
       in print l