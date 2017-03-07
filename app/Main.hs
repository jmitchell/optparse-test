module Main where

import Lib

import Control.Monad
import Options.Applicative
import Data.Semigroup ((<>))

data Sample = Sample
  { hello  :: String }

sample :: Parser Sample
sample = Sample
      <$> strOption
          ( long "hello"
         <> metavar "TARGET"
         <> help "Target for the greeting" )

main :: IO ()
main = greet =<< execParser opts
  where
    opts = info (sample <**> helper)
      ( fullDesc
     <> progDesc "Print a greeting for TARGET"
     <> header "hello - a test for optparse-applicative" )

greet :: Sample -> IO ()
greet (Sample h) = do putStrLn $ "Hello, " ++ h
