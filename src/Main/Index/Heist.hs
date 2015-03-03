{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE ConstraintKinds #-}

module Main.Index.Heist
  ( indexSplices
  ) where

import Data.Monoid
import Data.Text (Text)

-- happstack
import Happstack.Server

-- heist
import Heist
import Heist.Compiled

-- local
import Main.Types

indexSplices :: MainMonad m => Splices (Splice m)
indexSplices = mconcat
  [ "test" ## testSplice
  ]

testSplice :: Splice m
testSplice = do
  return $ yieldPureText "ok!"
