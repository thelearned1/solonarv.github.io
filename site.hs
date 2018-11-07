{-# LANGUAGE OverloadedStrings #-}
import           Data.Semigroup
import           Data.Traversable
import           Data.Foldable
import           GHC.IO.Encoding as IO.Encoding
import           Hakyll


main :: IO ()
main = do
  IO.Encoding.setLocaleEncoding IO.Encoding.utf8
  hakyll $ do
  
    match "*.md" $ do
      route   $ setExtension "html"
      compile $ pandocCompiler
        >>= loadAndApplyTemplate "templates/default.html" defaultContext
        >>= relativizeUrls
  
    match "posts/*" $ do
      route $ setExtension "html"
      compile $ pandocCompiler
        >>= loadAndApplyTemplate "templates/post.html"  postCtx
        >>= loadAndApplyTemplate "templates/default.html" postCtx
        >>= relativizeUrls
  
    create ["archive.html"] $ do
      route idRoute
      compile $ do
        posts <- recentFirst =<< loadAll "posts/*"
        let
          archiveCtx =
            listField "posts" postCtx (return posts) <>
            constField "title" "Archives"      <>
            defaultContext
  
        makeItem ""
          >>= loadAndApplyTemplate "templates/archive.html" archiveCtx
          >>= loadAndApplyTemplate "templates/default.html" archiveCtx
          >>= relativizeUrls
  
  
    match "index.html" $ do
      route idRoute
      compile $ do
        posts <- recentFirst =<< loadAll "posts/*"
        let
          indexCtx =
            listField "posts" postCtx (return posts) <>
            constField "title" "Home"        <>
            defaultContext
  
        getResourceBody
          >>= applyAsTemplate indexCtx
          >>= loadAndApplyTemplate "templates/default.html" indexCtx
          >>= relativizeUrls
  
    
    ["images/*", "js/*", "*.html"] `for_` \s ->
      match s $ do
        route   idRoute
        compile copyFileCompiler

    match "css/*" $ do
      route   idRoute
      compile compressCssCompiler

    match "templates/*" $ compile templateBodyCompiler
  
  
--------------------------------------------------------------------------------
postCtx :: Context String
postCtx =
  dateField "date" "%B %e, %Y" <>
  defaultContext
  