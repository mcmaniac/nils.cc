{-# LANGUAGE ConstraintKinds #-}
{-# LANGUAGE FlexibleContexts #-}

module Main.Static.Serve where

import Control.Monad.Trans

import Happstack.Server

-- local
import Main.Types

staticServe :: MainMonad m => FilePath -> m Response
staticServe d = do
  method GET
  serveDirectory DisableBrowsing [] d
