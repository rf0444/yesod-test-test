{-# LANGUAGE OverloadedStrings #-}
module HomeTest
    ( homeSpecs
    ) where

import TestImport

homeSpecs :: Specs
homeSpecs = do
  describe "These are some example tests 1" $ do
    it "loads the index and checks it looks right 1-1" $ do
      get_ "/"
      statusIs 200
      htmlAllContain "h1" "Hello"

      post "/" $ do
        addNonce
        fileByLabel "Choose a file" "tests/main.hs" "text/plain" -- talk about self-reference
        byLabel "What's on the file?" "Some Content"

      statusIs 200
      htmlCount ".message" 1
      htmlAllContain ".message" "Some Content"
      htmlAllContain ".message" "text/plain"
    
    it "loads the index and checks it looks right 1-2" $ do
      get_ "/"
      statusIs 200
      htmlAllContain "h1" "Hello"

      post "/" $ do
        addNonce
        fileByLabel "Choose a file" "tests/main.hs" "text/plain" -- talk about self-reference
        byLabel "What's on the file?" "Some Content"

      statusIs 200
      htmlCount ".message" 1
      htmlAllContain ".message" "Some Content"
      htmlAllContain ".message" "text/plain"
  
  describe "These are some example tests 2" $ do
    it "loads the index and checks it looks right 2-1" $ do
      get_ "/"
      statusIs 200
      htmlAllContain "h1" "Hello"

      post "/" $ do
        addNonce
        fileByLabel "Choose a file" "tests/main.hs" "text/plain" -- talk about self-reference
        byLabel "What's on the file?" "Some Content"

      statusIs 200
      htmlCount ".message" 1
      htmlAllContain ".message" "Some Content"
      htmlAllContain ".message" "text/plain"
    
    it "loads the index and checks it looks right 2-2" $ do
      get_ "/"
      statusIs 200
      htmlAllContain "h1" "Hello"

      post "/" $ do
        addNonce
        fileByLabel "Choose a file" "tests/main.hs" "text/plain" -- talk about self-reference
        byLabel "What's on the file?" "Some Content"

      statusIs 200
      htmlCount ".message" 1
      htmlAllContain ".message" "Some Content"
      htmlAllContain ".message" "text/plain"

