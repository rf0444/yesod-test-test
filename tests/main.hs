{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE NoMonomorphismRestriction #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module Main where

import Import
import Settings
import Yesod.Default.Config
import Yesod.Test
import Application (makeFoundation)
import Test.Hspec (hspec)

import NormalTest
import PropTest
import PersistTest
import HomeTest

main :: IO ()
main = do
  normalTest
  propTest
  persistTest
  yesodTest

normalTest :: IO ()
normalTest = hspec normalSpecs

propTest :: IO ()
propTest = hspec propSpecs

persistTest :: IO ()
persistTest = do
  conf <- loadConfig $ (configSettings Testing) { csParseExtra = parseExtra }
  foundation <- makeFoundation conf
  app <- toWaiAppPlain foundation
  runTests app (connPool foundation) persistSpecs

yesodTest :: IO ()
yesodTest = do
  conf <- loadConfig $ (configSettings Testing) { csParseExtra = parseExtra }
  foundation <- makeFoundation conf
  app <- toWaiAppPlain foundation
  runTests app (connPool foundation) homeSpecs
