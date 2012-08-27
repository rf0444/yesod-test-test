module NormalTest
    ( normalSpecs
    , ioSpecs
    ) where

import Test.Hspec
import Control.Exception

normalSpecs :: Spec
normalSpecs = do
  describe "These are some simple tests 1" $ do
    it "should be 2 if 1 + 1" $ do
      let x = 1 + 1 :: Int
      x `shouldBe` 2
    it "should be 0 if 1 - 1" $ do
      let x = 1 - 1 :: Int
      x `shouldBe` 0
    it "should be even if 3 + 5" $ do
      let x = 3 + 5 :: Int
      x `shouldSatisfy` even
    it "should be thrown some Exception if 0 `div` 0 evaluated" $ do
      let x = 0 `div` 0 :: Int
      print x `shouldThrow` anyException
    it "should be thrown ArithException if 0 `div` 0 evaluated" $ do
      let x = 0 `div` 0 :: Int
      print x `shouldThrow` anyArithException
    it "should be thrown DivideByZero if 0 `div` 0 evaluated" $ do
      let x = 0 `div` 0 :: Int
      print x `shouldThrow` (== DivideByZero)

ioSpecs :: Spec
ioSpecs = do
  describe "These are some io tests" $ do
    it "should be original if return" $ do
      let ioX = return "hoge" :: IO String
      do
        x <- ioX
        x `shouldBe` "hoge"
    it "should be original length if return" $ do
      let ioX = return "hoge" :: IO String
      do
        x <- ioX
        length x `shouldBe` 4

