{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}

module Main.Heist where

import Control.Monad.Trans

import Data.Monoid

-- happstack
import Happstack.Server
import Happstack.Server.Heist

-- heist
import Heist

-- local
import Main.Types
import Main.Index.Heist

loadTemplates :: (MonadIO m, MainMonad n) => m (HeistState n)
loadTemplates = do
  r <- initHeistCompiled compiledSplices attributeSplices "templates"
  case r of
    Left  e -> error $ "Failed loading heist templates: " ++ show e
    Right s -> return s
 where
  compiledSplices  = mconcat [ indexSplices ]
  attributeSplices = mconcat []
