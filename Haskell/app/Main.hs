module Main where

import qualified MyLib (someFunc)

isLetterX :: Char -> Bool
isLetterX c = c == 'x'

main :: IO ()
main = do
    putStrLn "Hello, Haskell!"
    MyLib.someFunc
    c <- getChar
    if isLetterX c 
        then do 
            putStrLn "The letter is x!" 
        else do 
            putStrLn "The letter is not x!"
    
