{-# LANGUAGE OverloadedStrings #-}
module PersistTest
    ( persistSpecs
    ) where

import qualified Database.Persist as P

import TestImport
import Model

persistSpecs :: Specs
persistSpecs = do
  describe "These are some simpl tests 1" $ do
    it "should be original if insert" $ do
      runDB $ P.deleteWhere ([] :: [P.Filter User])
      key <- runDB $ P.insert $ User {
        userIdent = "hoge ident", userPassword = Just "hoge password"
      }
      user <- runDB $ P.get key
      assertEqual "user ident" (user >>= return . userIdent) (Just "hoge ident")
      assertEqual "user password" (user >>= userPassword) (Just "hoge password")

