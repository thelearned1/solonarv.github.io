--------------------------------------------------------------------------------
{-# LANGUAGE LambdaCase        #-}
{-# LANGUAGE OverloadedStrings #-}
import           Control.Monad
import           Data.Semigroup
import           Text.Pandoc.Options

import           Hakyll


--------------------------------------------------------------------------------
main :: IO ()
main = hakyll $ do
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
            >>= loadAndApplyTemplate "templates/post.html"    postCtx
            >>= htmlFinalPipeline postCtx

    create ["archive.html"] $ do
        route idRoute
        compile $ do
            posts <- recentFirst =<< loadAll "posts/*"
            let archiveCtx =
                    listField "posts" postCtx (return posts) <>
                    constField "title" "Archives"            <>
                    defaultContext

            makeItem ""
                >>= loadAndApplyTemplate "templates/archive.html" archiveCtx
                >>= htmlFinalPipeline archiveCtx


    match "index.html" $ do
        route idRoute
        compile $ do
            posts <- recentFirst =<< loadAll "posts/*"
            let indexCtx =
                    listField "posts" postCtx (return $ take 5 posts) <>
                    constField "title" "Home"                         <>
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
myPandocCompiler = pandocCompilerWith (noSmartR defaultHakyllReaderOptions) (noSmartW defaultHakyllWriterOptions)
