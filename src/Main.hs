module Main where

import Control.Monad

-- happstack
import Happstack.Server
import Happstack.Server.Heist

-- heist
-- import Heist

-- local
import Main.Heist

import Main.Static.Serve

main :: IO ()
main = do
  putStrLn "Starting..."
  hs <- loadTemplates
  simpleHTTP conf $ msum
    [ dir "static" $ staticServe "static"
    , nullDir >> heistServe hs
    , notFound $ toResponse "404: Not found."
    ]
 where
  conf = nullConf { port = 8080 }
