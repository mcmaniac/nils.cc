{-# LANGUAGE ConstraintKinds #-}

module Main.Types where

import Control.Monad
import Control.Monad.Trans

-- happstack
import Happstack.Server

type MainMonad m =
  ( MonadPlus m
  , MonadIO m
  , ServerMonad m
  , FilterMonad Response m
  , WebMonad Response m
  )
