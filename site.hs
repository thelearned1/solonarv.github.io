{-
    === LICENSE ===
    Based on Hakyll's default template, customized by Solonarv.
    Subject to the GPL v3.0, see GPLV3.txt for a copy of the license.
-}
--------------------------------------------------------------------------------
{-# LANGUAGE LambdaCase        #-}
{-# LANGUAGE OverloadedStrings #-}
import           Control.Applicative
import           Control.Monad
import           Data.Semigroup
import           GHC.IO.Encoding       as E
import           System.FilePath.Posix
import           Text.Pandoc.Options

import           Hakyll


--------------------------------------------------------------------------------
main :: IO ()
main = do
  E.setLocaleEncoding E.utf8
  hakyll $ do
    match "images/*" $ do
      route   idRoute
      compile copyFileCompiler

    match "css/*" $ do
      route   idRoute
      compile compressCssCompiler

    match (fromList ["about.md", "contact.md"]) $ do
      route   $ setExtension "html"
      compile $ myPandocCompiler
        >>= htmlFinalPipeline defaultContext

    match "posts/*" $ do
      route $ setExtension "html"
      compile $ myPandocCompiler
        >>= loadAndApplyTemplate "templates/post.html"  postCtx
        >>= htmlFinalPipeline postCtx

    create ["archive.html"] $ do
      route idRoute
      compile $ do
        posts <- recentFirst =<< loadAll "posts/*"
        let
          archiveCtx =
            listField "posts" postCtx (pure posts) <>
            constField "title" "Archives"      <>
            defaultContext

        makeItem ""
          >>= loadAndApplyTemplate "templates/archive.html" archiveCtx
          >>= htmlFinalPipeline archiveCtx


    match "index.html" $ do
      route idRoute
      compile $ do
        posts <- recentFirst =<< loadAll "posts/*"
        let
          indexCtx =
            listField "posts" postCtx (pure $ take 5 posts) <>
            constField "title" "Home"             <>
            defaultContext

        getResourceBody
            >>= applyAsTemplate indexCtx
            >>= htmlFinalPipeline indexCtx

    match "templates/*" $ compile templateBodyCompiler


--------------------------------------------------------------------------------
postCtx :: Context String
postCtx =
  dateField "date" "%A %B %-e, %Y" <>
  defaultContext

htmlFinalPipeline :: Context String -> Item String -> Compiler (Item String)
htmlFinalPipeline ctx =
  loadAndApplyTemplate "templates/default.html" ctx
    >=> relativizeUrls

noSmartR :: ReaderOptions -> ReaderOptions
noSmartR opts = opts { readerExtensions = disableExtension Ext_smart $ readerExtensions opts}

noSmartW :: WriterOptions -> WriterOptions
noSmartW opts = opts { writerExtensions = disableExtension Ext_smart $ writerExtensions opts}

myPandocCompiler :: Compiler (Item String)
myPandocCompiler = pandocCompiler -- With (noSmartR defaultHakyllReaderOptions) (noSmartW defaultHakyllWriterOptions)
