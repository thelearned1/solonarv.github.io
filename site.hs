{-# LANGUAGE OverloadedStrings #-}
import           Control.Monad
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
        >>= finalizeHtml defaultContext
  
    match "posts/*" $ do
      route $ setExtension "html"
      compile $ pandocCompiler
        >>= loadAndApplyTemplate "templates/post.html"  postCtx
        >>= finalizeHtml postCtx
  
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
          >>= finalizeHtml archiveCtx
  
  
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
          >>= finalizeHtml indexCtx
  
    
    match ("images/*" .||. "js/*" .||. "*.html") $ do
      route   idRoute
      compile copyFileCompiler

    match "css/*" $ do
      route   idRoute
      compile compressCssCompiler

    match "templates/*" $ compile templateBodyCompiler
  
  
--------------------------------------------------------------------------------
postCtx :: Context String
postCtx =
  dateField "date" "%A %B %-e, %Y" <>
  defaultContext

finalizeHtml :: Context String -> Item String -> Compiler (Item String)
finalizeHtml ctx =
  loadAndApplyTemplate "templates/default.html" ctx
    >=> relativizeUrls