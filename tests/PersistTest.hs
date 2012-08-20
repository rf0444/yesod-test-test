{-# LANGUAGE OverloadedStrings #-}
module PersistTest
    ( persistSpecs
    ) where

import Database.Persist.GenericSql (Connection)
import qualified Database.Persist as P
import Control.Exception.Lifted (bracket_)

import TestImport
import Model

withDeleteUserTable :: OneSpec Connection a -> OneSpec Connection a
withDeleteUserTable = bracket_ setUpUserTable tearDownUserTable
  where
    setUpUserTable = deleteUserTable
    tearDownUserTable = deleteUserTable
    deleteUserTable = runDB $ P.deleteWhere ([] :: [P.Filter User])

persistSpecs :: Specs
persistSpecs = do
  describe "These are some simpl tests 1" $ do
    it "should be original if insert" $ withDeleteUserTable $ do
      key <- runDB $ P.insert $ User {
        userIdent = "hoge ident", userPassword = Just "hoge password"
      }
      user <- runDB $ P.get key
      assertEqual "user ident" (user >>= return . userIdent) (Just "hoge ident")
      assertEqual "user password" (user >>= userPassword) (Just "hoge password")

